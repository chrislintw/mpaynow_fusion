# frozen_string_literal: true

module CreditCards
  extend ActiveSupport::Concern
  included do
    validates :card_last4, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999 }, allow_nil: true
    validates :card_first6, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 999_999 }, allow_nil: true
  end

  extend Enumerize
  enumerize :payment_type, in: { visa: 1, mastercard: 2, union_pay: 3, jcb: 4, amex: 5, discover: 6 }, predicates: true
end
