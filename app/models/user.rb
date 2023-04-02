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

  has_many :resumes
  # s1.resumes = Resume(這是class_name).where(user_id:(這是foreign_key) s1.id)
  enum role: {user: 1, company: 2, staff: 3}
  # 如果是用 enum role: [:user, :company, :staff] key的值就是陣列的位置，key的位置改了直也會跟的變，不建議使用!
  enum role: {"不公開": 0, "男生": 1, "女生": 2}
  #上面的enum 是給 資料型態為integer的資料欄位使用

  before_create :encrypt_password

  class << self
    def gender_list
      gender.map { |k, v| [k, k] }
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
