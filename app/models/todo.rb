class Todo < ActiveRecord::Base
  belongs_to :user
  before_save :default_values
  validates :name, :presence => {message: "Task name can't be blank"}

  private
  def default_values
    self.finished ||= false
    true
  end
end
