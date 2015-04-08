# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_type :string
#  commentable_id   :integer
#  body             :text
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
	belongs_to :commentable, polymorphic: true
	belongs_to :user
end
