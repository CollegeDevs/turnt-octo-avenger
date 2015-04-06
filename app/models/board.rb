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
#

class Board < ActiveRecord::Base
	belongs_to :owner, class_name: 'User', foreign_id: 'owner_id'
	belongs_to :project
end
