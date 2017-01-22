class RoomsController < ApplicationController
  inherit_resources

  before_action :authenticate_user!, except: [:show
  ]
  private

  def room_params
    params.require(:room).permit(:home_type, :room_type, :accommodate, :bed_room, :bath_rrom, :listing_name, :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating, :is_internet, :price, :active)
  end
end
