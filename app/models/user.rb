class User < ApplicationRecord # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable # Include default devise modules. Others available are:
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  after_create :welcome_send
  has_many :events
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
