class HomeController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin.to_s == "true"
        @todo_list = Todo.all.order(:priority)
      else
        @todo_list = Todo.where(:user_id => current_user.id).order(:priority)
      end
    end
  end
end