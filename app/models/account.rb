class Account < ApplicationRecord
  extend Enumerize
  has_many :accounts_users
  has_many :users, through: :accounts_users
  has_many :groups
  has_many :campaigns
  has_many :items
  has_many :goods
  has_many :bookings
  has_many :services
  has_many :deliveries
  has_many :requests
  has_many :expresses
  has_many :policies
  has_many :payment_settings
  belongs_to :blocked_by, class_name: "FusionUser"
  serialize :report_emails, Array
  serialize :request_copy_to, Array

  # validates :employees, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :request_sender_name, length: { maximum: 255 }, presence: true
  validates :notice_enabled, acceptance: { accept: [true, false] }

  # validates :request_copy_to, length: { maximum: 255 }

  def logo_url
    '/images/default_image2x.png'
  end

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
