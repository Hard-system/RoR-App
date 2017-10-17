class CreateCabinsReservationsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cabins, :reservations do |t|
      # t.index [:cabin_id, :reservation_id]
      # t.index [:reservation_id, :cabin_id]
    end
  end
end
