class TravelagentController < ApplicationController
  def index
    @cruises = Cruise.all
    @cruise_names = []
    @cabins_available = []
    @cruises.each do |cruise|
      @cruise_names << cruise.name
      @cruise_cabins = Cabin.where(["ship_id = ?", cruise.ship_id]).count('id')
      @cabins_available << @cruise_cabins
    end
    @reservation_groups = Reservation.all.group('cruise_id').count('id')
   
    @bookings = []
    @reservation_groups.each do |group|
      @bookings << group[1]
    end
    
  end
end
