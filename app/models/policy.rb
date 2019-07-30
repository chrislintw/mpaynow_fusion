# frozen_string_literal: true

# == Schema Information
#
# Table name: policies
#
#  id                 :bigint(8)        not null, primary key
#  title              :string(255)      not null
#  uuid               :string(255)      not null
#  term_and_condition :text(65535)      not null
#  privacy_policy     :text(65535)      not null
#  refund_policy      :text(65535)
#  account_id         :bigint(8)        not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Policy < ApplicationRecord
  extend Enumerize
  belongs_to :account
  validates :title, presence: true, length: { maximum: 255 }, uniqueness: { scope: [:account_id], case_sensitive: true }
  validates :term_and_condition, :privacy_policy, :refund_policy, presence: true, length: { maximum: 65_535 }
end
