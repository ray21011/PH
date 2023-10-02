class Perfume < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

 has_many :contact, dependent: :destroy
end
