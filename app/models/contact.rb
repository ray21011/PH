class Contact < ApplicationRecord
  belongs_to :customer
	#バリデーション
	validates :title, presence: true
	validates :body, presence: true
end
