class Campaign < ApplicationRecord
  extend Enumerize
  belongs_to :account
  has_many :campaigns_items, dependent: :destroy
  has_many :items, through: :campaigns_items
  has_many :requests, dependent: :nullify
  validates :name, presence: true, length: { maximum: 255 }
  validates :started_on, :ended_on, presence: true
end
