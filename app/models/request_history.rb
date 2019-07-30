class RequestHistory < ApplicationRecord
  belongs_to :request, polymorphic: true
  belongs_to :user, optional: true
  belongs_to :request_transaction, optional: true
end