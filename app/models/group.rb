# frozen_string_literal: true

# == Schema Information
#
# Table name: groups
#
#  id         :bigint(8)        not null, primary key
#  uuid       :string(255)      not null
#  name       :string(255)      not null
#  account_id :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  belongs_to :account
  has_many :groups_users, dependent: :destroy
  has_many :users, through: :groups_users
  has_many :requests, dependent: :nullify
  has_many :groups_items, dependent: :destroy
  has_many :items, through: :groups_items
  validates :name, presence: true, length: { maximum: 255 }, uniqueness: { scope: [:account_id], case_sensitive: true }
end
