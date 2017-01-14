class Account < ActiveRecord::Base
  has_many :members
end
