class Cabin < ApplicationRecord
  belongs_to :ship
  has_and_belongs_to_many :reservations
end
