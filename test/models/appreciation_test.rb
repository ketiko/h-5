# == Schema Information
#
# Table name: appreciations
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  points     :integer
#  token      :string
#  given      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_appreciations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class AppreciationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
