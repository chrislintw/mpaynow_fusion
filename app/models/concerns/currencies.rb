# frozen_string_literal: true

module Currencies
  extend ActiveSupport::Concern
  included do
    validates :currency, presence: true
  end

  extend Enumerize

  CURRENCY_LIST = { hkd: 0, twd: 1, cny: 2, jpy: 3, usd: 4 }.freeze
  CURRENCY_UNIT = { 'hkd' => 'HKD $', 'twd' => 'TWD $', 'cny' => 'CNY ¥' }.freeze

  enumerize :currency,
            in: CURRENCY_LIST,
            predicates: true

  # def amount_format(a = :amount)
  #   "#{CURRENCY_UNIT[currency]}#{self.send(a)}"
  # end
end
