class Order < ApplicationRecord

	belongs_to :customer, class_name: 'User', foreign_key: :customer_id

	belongs_to :seller, class_name: 'User'
end
