# this file makes use of Faker gem to generate random data
namespace :ships do
  desc "TODO"
  task seed_cabins: :environment do
    
    #remove the data from the tables before creating new data
    #this ensures we have no stray references to objects that no longer exist
    Ship.destroy_all
    Cabin.destroy_all
    Cruise.destroy_all
    Customer.destroy_all
    Address.destroy_all
    CreditCard.destroy_all
    Reservation.destroy_all
    p "tables emptied"
    
    #create the ships
    5.times do |index |
    Ship.create!(name: Faker::Coffee.blend_name,
                 tonnage: Faker::Number.number(2).to_i*1000 )
    end
    p "ships created"
    
    #create cabins for each ship
    ships = Ship.all
    ships.each  do |ship|
      5.times do | index |
        Cabin.create!(
          ship_id: ship.id,
          name: "Suite #{index+1}",
          beds: Faker::Number.between(1,3),
          deck: Faker::Number.between(1,3) )
      end         
    end
     p "cabins created"
    
    #create cruises using the ships
    # the rails capitalize method does just that to each word
     ships = Ship.all
     ships.each  do |ship|
      2.times do | index |
        Cruise.create!(
          ship_id: ship.id,
          name: Faker::Hacker.adjective.capitalize + " " + Faker::Hacker.noun.capitalize+" Cruise"
           )
      end         
    end
    p "cruises created"
    
    #create customers
    3.times do |index |
      Customer.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        has_good_credit: true,
        paid: false
      )
    end
  
   #give each customer an addresses and credit card
    customers = Customer.all
    customers.each do | customer|
      Address.create!(
      street: Faker::Address.street_address,
      city: Faker::Address.city,
      postcode: Faker::Address.postcode,
      customer_id: customer.id
      )
      year = [2020, 2021, 2022, 2023]
      organisations = ["American Express", "MasterCard", "Visa"]
      CreditCard.create!(
        customer_id: customer.id,
        number: Faker::Number.number(12),
        exp_date: year.sample.to_s + "/" + Faker::Number.between(1,12).to_s,
        name_on_card: customer.first_name + " " + customer.last_name,
        organisation: organisations.sample.to_s
      )
    end
    p "customers created"
    
    #with everything in place we can create reservations.
    #we use 'save' instead of 'create' in order to get all parameters into the reservation
    cruises = Cruise.all
    customers = Customer.all
    cruises.each do |cruise|
      
      2.times do |index|
        reservation = Reservation.new(
          cruise_id: cruise.id,
          customer_id: customers.sample.id
        )
        reservation.save
        #get list of cabins on the ship
        cabins = Cabin.where(["ship_id = ?", cruise.ship_id])
        booked_cabins = []
        #determine which ones are already reserved
        #we should then remove these from cabins array
        cabins.each do | cabin|
          cabin_reservation = Cabin.find_by_sql(
              "select cabin_id from cabins_reservations where cabin_id = #{cabin.id} ")
          if cabin_reservation.empty?  == false
            booked_cabins << cabin
          end
        end
        reservation.save
        
      end
    end
    p "reservations created"
  end
end 
