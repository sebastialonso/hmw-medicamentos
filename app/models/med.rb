class Med < ActiveRecord::Base
  has_many :prices, dependent: :destroy
  has_many :pharmacies, through: :prices
end
