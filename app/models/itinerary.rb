class Itinerary < ApplicationRecord
  belongs_to :trip

  has_many :destinations
  accepts_nested_attributes_for :destinations, allow_destroy: true
end
