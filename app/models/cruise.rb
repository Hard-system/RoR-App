class Cruise < ApplicationRecord
  belongs_to :ship
  has_many :reservations
end
