class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :cruise
  has_many :payments
  has_and_belongs_to_many :cabins
end
