class Price < ActiveRecord::Base
  belongs_to :med
  belongs_to :pharmacy
end
