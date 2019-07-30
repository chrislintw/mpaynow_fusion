# frozen_string_literal: true

# == Schema Information
#
# Table name: groups_users
#
#  id       :bigint(8)        not null, primary key
#  user_id  :bigint(8)        not null
#  group_id :bigint(8)        not null
#

class GroupsUser < ApplicationRecord
  belongs_to :group
  belongs_to :user
end
