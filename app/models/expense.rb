class Expense < ApplicationRecord

	attribute :approved, :string, default: "waiting"
	validates :claimer_name , presence: true
	validates :expense_date , presence: true
	validates :description , presence: true
	validates :amount , presence: true

	has_attached_file :image
	validates_attachment_content_type :image, 
	:content_type => ["image/jpg", "image/jpeg", "image/png"]


	belongs_to :user
end
