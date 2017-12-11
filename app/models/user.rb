class User < ApplicationRecord
  has_many :blog
  has_many :comment
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

validates_presence_of :name
validates_presence_of :username

end
