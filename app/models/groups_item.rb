# frozen_string_literal: true

# == Schema Information
#
# Table name: groups_items
#
#  id         :bigint(8)        not null, primary key
#  item_id    :bigint(8)        not null
#  group_id   :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GroupsItem < ApplicationRecord
  belongs_to :group
  belongs_to :item
end
