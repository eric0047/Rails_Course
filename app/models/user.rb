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
class User < ApplicationRecord
  validates :email, presence: true,
                    uniqueness: true,
                    # 一個網站只能有一筆
                    format: {with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/ }
  validates :password, presence: true, confirmation: true
  validates :birthday, presence: true

  before_create :encrypt_password

  class << self
    def gender_list
      [["不公開", 0], ["男生", 1], ["女生", 2], ["其他", 3] ]
    end
  
    def login(email:, password:)
      # 把引數放在參數的後面，就是直接當作key的value使用
      encrypted_password = Digest::SHA1.hexdigest("7a#{password}9x")
      find_by(email: email, password: encrypted_password)
    end
  end

  def encrypt_password
    self.password = Digest::SHA1.hexdigest("7a#{self.password}9x")
    #密碼手動加亂碼 => salting encryption
  end
end