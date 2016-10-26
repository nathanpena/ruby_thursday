  #Replace with below for Option 1: with 'capybara-webkit' 
  ENV['RAILS_ENV'] ||= 'test'
  require File.expand_path('../../config/environment', __FILE__)
  # Prevent database truncation if the environment is production
  abort("The Rails environment is running in production mode!") if Rails.env.production?
  require 'spec_helper'
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'simple_bdd'
  require 'shoulda/matchers'
  Capybara.javascript_driver = :webkit

  ActiveRecord::Migration.maintain_test_schema!

  RSpec.configure do |config|
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    config.use_transactional_fixtures = true
    
    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
      DatabaseCleaner.clean_with(:truncation)
    end 

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end

    config.include SimpleBdd, type: :feature
    
    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end
    
    config.infer_spec_type_from_file_location!

    config.filter_rails_from_backtrace!   

  end