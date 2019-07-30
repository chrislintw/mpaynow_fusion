# frozen_string_literal: true

# == Schema Information
#
# Table name: request_details
#
#  id            :bigint(8)        not null, primary key
#  uuid          :string(255)      not null
#  name          :string(255)      not null
#  count         :integer          unsigned, not null
#  price         :integer          unsigned, not null
#  address       :string(255)
#  metadata      :string(255)
#  booked_at     :datetime
#  checkedout_at :datetime
#  guest_name    :string(255)
#  request_id    :bigint(8)        not null
#  item_id       :bigint(8)        not null
#  item_category :integer          unsigned, not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class RequestDetail < ApplicationRecord
  include Imageable
  belongs_to :request
  belongs_to :item

  validates :name, presence: true, length: { maximum: 255 }
  validates :count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99 }
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 4_294_967_295 }
  validates :address, length: { maximum: 255 }
  validates :metadata, length: { maximum: 255 }


  has_one_attached :image, dependent: false
  
  def checkedin_at
    booked_at
  end

  def checkedin_at=(value)
    self.booked_at = value
  end

  def format_price
    integer_division_by_100(price)
  end

end
