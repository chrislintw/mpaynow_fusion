class User  < ApplicationRecord
  include Languages
  include Currencies
  has_many :accounts_users
  has_many :accounts, through: :accounts_users
  has_many :groups_users, dependent: :destroy
  has_many :groups, through: :groups_users
  has_many :campaigns, through: :groups
  has_many :requests, foreign_key: :created_by_id, dependent: :restrict_with_error
  belongs_to :blocked_by, class_name: "FusionUser"

  validates :email, length: { maximum: 255 }, presence: true, email: true
  validates :name, length: { maximum: 255 }, presence: true
  def status
    :BLOCKED if blocked_at
  end
  def block_by(user)
    update(blocked_at: Time.now.utc, blocked_by: user)
  end
  def unblock_by(user)
    update(blocked_at: nil, blocked_by: user)
  end
end