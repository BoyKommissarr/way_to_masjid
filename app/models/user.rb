class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mosques

  after_initialize :set_default_time_zone, if: :new_record?

  private

  def set_default_time_zone
    self.time_zone ||= "Asia/Kolkata"
  end
end
