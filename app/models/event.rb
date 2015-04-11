# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  start_time  :datetime
#  end_time    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  project_id  :integer
#  board_id    :integer
#

class Event < ActiveRecord::Base

	#after_validation :check_start_time_format
	#after_validation :check_end_time_format

	validate :end_time_cannot_be_earlier_than_start
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :name, presence: true, length: {in: 3..100}
	validates :description, presence: true, length: {in: 3..1000}


	belongs_to :project
	belongs_to :user
	belongs_to :board

	scope :recent, ->{where('end_time > ?',Time.now)}

	private

	def end_time_cannot_be_earlier_than_start
		unless end_time.nil? || start_time.nil?
			time_error if end_time < start_time
		end
	end

	def time_error
		errors.add(:time_error, 'We hope sooner there will be Time Travel!')
	end

	def check_start_time_format
		self.start_time = self.start_time.strftime('%m/%d/%Y %I:%M %p')
	end

	def check_end_time_format
		self.end_time = self.end_time.strftime('%m/%d/%Y %I:%M %p')
	end

end
