class Resume < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: {with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/ }
  validates :tel, presence: true

  def self.search(keyword)
    where("intro like ?", "%#{keyword}%")
  end
end
