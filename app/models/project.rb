# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  make_public :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  due_date    :date
#  owner_id    :integer
#  slug        :string
#
# Indexes
#
#  index_projects_on_slug  (slug) UNIQUE
#

class Project < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: :slugged

	belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
	has_many :boards
	has_many :projectusers
	has_many :users, through: :projectusers
	has_many :events
end
