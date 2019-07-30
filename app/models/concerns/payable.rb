# frozen_string_literal: true

module Payable
  extend ActiveSupport::Concern
  REQUEST_STATUS = { pending: 1, expired: 2, failed: 3, completed: 4, closed: 5, refunded: 6 }.freeze
  included do
    # Relationships
    belongs_to :account
    belongs_to :created_by, class_name: 'User'
    belongs_to :refunded_by, class_name: 'User', optional: true
    belongs_to :extended_by, class_name: 'User', optional: true
    has_many :transactions, class_name: 'RequestTransaction', as: :request
    has_many :history, class_name: 'RequestHistory', as: :request
    # Enum
    enumerize :status, in: REQUEST_STATUS, default: :pending, predicates: true
    # Validation
    validates :term_and_condition, :privacy_policy, :refund_policy, presence: true, length: { maximum: 65_535 }
    validates :area_code, :phone, :email, length: { maximum: 255 }
    validates :name, length: { maximum: 255 }, presence: true
    validates :remarks, length: { maximum: 65_535 }
    validates :expired_on, presence: true

    # Scope
    default_scope -> { order(created_at: :desc) }
  end
  
end
