# == Schema Information
#
# Table name: boardusers
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  board_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Boarduser < ActiveRecord::Base
	belongs_to :board
	belongs_to :user
end
