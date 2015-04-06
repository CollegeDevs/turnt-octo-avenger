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
#

class Project < ActiveRecord::Base
	belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
	has_many :boards
	belongs_to :user
end
