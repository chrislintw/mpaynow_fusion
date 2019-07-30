# frozen_string_literal: true

module Intervals
  extend ActiveSupport::Concern
  included do
    validates :interval, presence: true
    validates :interval_count, presence: true
  end

  extend Enumerize

  enumerize :interval, in: { month: 0, year: 1, day: 2 }, predicates: true, default: :month
end
