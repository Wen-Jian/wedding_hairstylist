class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  has_many :orders, :foreign_key => :customer_id

  has_many :sells, class_name: 'Order', :foreign_key => 'seller_id'

end
