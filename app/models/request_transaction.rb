class RequestTransaction < ApplicationRecord
  belongs_to :request, polymorphic: true
  has_one :payer
end