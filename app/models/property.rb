class Property < ApplicationRecord
  validates :name, presence: true
  validates :rent, presence: true
  validates :address, presence: true
  validates :age, presence: true
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations
end
