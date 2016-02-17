class HomeController < ApplicationController
  def index
    if user_signed_in?
      @todo_list = Todo.where(:user_id => current_user.id)
    end
  end
end