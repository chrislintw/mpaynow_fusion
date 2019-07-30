# frozen_string_literal: true

# == Schema Information
#
# Table name: campaigns_items
#
#  id          :bigint(8)        not null, primary key
#  campaign_id :bigint(8)        not null
#  item_id     :bigint(8)        not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class CampaignsItem < ApplicationRecord
  belongs_to :campaign
  belongs_to :item
end
