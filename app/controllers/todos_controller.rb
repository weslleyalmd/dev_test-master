class TodosController < ApplicationController
  def index
    @todos = Todo.where(:user_id => current_user.id)
  end

  def new
    @todo = Todo.new(user_id: current_user.id)
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render action: "index"
    else
      render action: "new"
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(get_id_from_params)

    respond_to do |format|
      if @todo.update_attributes(todo_params)
        format.html {render action: "index"}
        format.json {render :json => @todo, status: :ok}
      else
        format.html {render action: "edit"}
        format.json {render :json => @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo = Todo.find(get_id_from_params)
    @todo.destroy

    respond_to do |format|
      format.html {render action: "index"}
      format.json {render :json => @todo, status: :ok}
    end
  end

  private
  def get_id_from_params
    params[:id].to_i != 0 ? params[:id] : params[:todo][:id]
  end

  def todo_params
    params.require(:todo).permit(
      :name, :user_id, :finished
    )
  end
end