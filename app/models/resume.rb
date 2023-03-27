class Resume < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :tel, presence: true
end
