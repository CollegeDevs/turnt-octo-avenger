# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#

class Comment < ActiveRecord::Base
	belongs_to :board
	belongs_to :user
end
