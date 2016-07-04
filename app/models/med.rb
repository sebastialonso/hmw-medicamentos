class Med < ActiveRecord::Base
  has_many :prices
  has_many :pharmacies, through: :prices
end
