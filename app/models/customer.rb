class Customer < ApplicationRecord
    has_one :address
    has_many :credit_cards
    has_many :reservations
    validates :first_name, :last_name, :has_good_credit, presence: true
end
