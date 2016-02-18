class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todos, :dependent => :delete_all

  validates :username, :presence => {message: "Username can't be blank"}
  validates :username, :uniqueness => {message: "Username already in use. Please choose another"}

end







