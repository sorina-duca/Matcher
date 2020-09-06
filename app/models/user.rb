class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: { message: 'Please give your first name' }
  has_many :requester_meetings, class_name: 'Meeting', foreign_key: 'requester_id', dependent: :destroy
  has_many :accepter_meetings, class_name: 'Meeting', foreign_key: 'accepter_id', dependent: :destroy
  has_many :availabilities, dependent: :destroy
end
