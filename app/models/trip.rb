class Trip < ApplicationRecord
  has_many :itineraries
  accepts_nested_attributes_for :itineraries
end
