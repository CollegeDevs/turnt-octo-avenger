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

require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
