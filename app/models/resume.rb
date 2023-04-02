# == Schema Information
#
# Table name: resumes
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  tel        :string
#  skill      :string
#  intro      :text
#  city       :string
#  education  :text
#  experience :text
#  portfolio  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  deleted_at :datetime
#
class Resume < ApplicationRecord
  acts_as_paranoid

  validates :name, presence: true
  validates :email, presence: true, format: {with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/ }
  validates :tel, presence: true

  belongs_to :user

  def self.search(keyword)
    where("intro like ?", "%#{keyword}%")
  end
end
