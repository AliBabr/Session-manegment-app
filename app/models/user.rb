class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_and_belongs_to_many :sites
  validates_uniqueness_of :email
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
