class User < ApplicationRecord
  SUPER_ADMIN_EMAIL = "ntsuperadmin@namaztime.com".freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :mosques

  after_initialize :set_default_time_zone, if: :new_record?

  MUAZZIN = "muazzin".freeze
  ADMIN = "admin".freeze

  enum :role, admin: ADMIN, muazzin: MUAZZIN
  def self.super_admin
    User.find_by(email: SUPER_ADMIN_EMAIL)
  end

  private

  def set_default_time_zone
    self.time_zone ||= "Asia/Kolkata"
  end
end
