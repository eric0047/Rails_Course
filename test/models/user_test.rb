# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  password   :string
#  nickname   :string
#  birthday   :date
#  role       :integer          default(1)
#  gender     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
