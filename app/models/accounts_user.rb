class AccountsUser < ApplicationRecord
  belongs_to :account
  belongs_to :user
  extend Enumerize
  enumerize :role, in: { normal: 1, read_only: 2, finance: 3, admin: 99 }, default: :normal, predicates: true
  validates :expiry_day, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 365 }, allow_nil: true
  validates :term_and_condition, :privacy_policy, :refund_policy, length: { maximum: 65_535 }, allow_nil: true
end