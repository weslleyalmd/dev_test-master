class User < ActiveRecord::Base
  before_save :default_values
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todos, :dependent => :delete_all

  validates :username, :presence => {message: "Username can't be blank"}
  validates :username, :uniqueness => {message: "Username already in use. Please choose another"}

  enum admin: [:false, :true]

  private
  def default_values
    self.admin ||= false
    true
  end

end







