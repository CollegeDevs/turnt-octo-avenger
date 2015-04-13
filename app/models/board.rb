# == Schema Information
#
# Table name: boards
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  project_id  :integer
#  owner_id    :integer
#  slug        :string
#
# Indexes
#
#  index_boards_on_slug  (slug) UNIQUE
#

class Board < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
	belongs_to :project
	has_many :comments
	has_many :events
end
