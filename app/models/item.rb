# frozen_string_literal: true

# == Schema Information
#
# Table name: items
#
#  id            :bigint(8)        not null, primary key
#  uuid          :string(255)      not null
#  type          :integer          not null
#  name          :string(255)
#  price         :integer          unsigned, not null
#  description   :text(65535)
#  unit          :string(255)
#  active        :boolean          default(TRUE), not null
#  currency      :integer          unsigned, not null
#  account_id    :bigint(8)        not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  deleted_at    :datetime
#  deleted_by_id :bigint(8)
#

class Item < ApplicationRecord
  ALLOWED_CLASSES = %w[Good Service Booking Delivery].freeze
  ALLOWED_RESOURCE_NAMES = ALLOWED_CLASSES.map { |klass| klass.downcase.pluralize }
  include Currencies
  include Imageable
  has_many :campaigns_items, dependent: :destroy
  has_many :campaigns, through: :campaigns_items
  has_many :groups_items, dependent: :destroy
  has_many :groups, through: :groups_items
  belongs_to :account

  has_many :request_details, dependent: :restrict_with_error

  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: %i[account_id type], case_sensitive: true }
  validates :unit, length: { maximum: 255 }
  validates :description, length: { maximum: 65_535 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4_294_967_295 }

  def category
    type
  end

  def url
    "/#{ALLOWED_RESOURCE_NAMES[type]}/#{uuid}"
  end

  def self.find_sti_class(type_name)
    ALLOWED_CLASSES[type_name.to_i].constantize
  rescue NameError, TypeError
    super
  end

  def self.sti_name
    ALLOWED_CLASSES.index(name)
  end

  def format_price
    integer_division_by_100(price)
  end
end

class Good < Item
end

class Booking < Item
end

class Service < Item
end

class Delivery < Item
end
