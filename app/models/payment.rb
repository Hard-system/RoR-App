class Payment < ApplicationRecord
  belongs_to :customer
  belongs_to :reservation
end
