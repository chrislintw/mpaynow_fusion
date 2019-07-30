# frozen_string_literal: true

module Countries
  extend ActiveSupport::Concern
  included do
    validates :country, presence: true
  end

  extend Enumerize

  COUNTRY_LIST = { hk: 0, tw: 1, cn: 2 }.freeze

  enumerize :country,
            in: COUNTRY_LIST,
            default: :hk,
            predicates: true
end
