class Request < ApplicationRecord
  REQUEST_STATUS = { pending: 1, expired: 2, failed: 3, completed: 4, closed: 5, refunded: 6 }.freeze
  belongs_to :account
  belongs_to :created_by, class_name: 'User'
  belongs_to :refunded_by, class_name: 'User', optional: true
  belongs_to :extended_by, class_name: 'User', optional: true
  has_many :transactions, class_name: 'RequestTransaction', as: :request
  has_many :history, class_name: 'RequestHistory', as: :request
  enumerize :status, in: REQUEST_STATUS, default: :pending, predicates: true
  default_scope -> { order(created_at: :desc) }
end