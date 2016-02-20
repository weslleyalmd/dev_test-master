class TodosController < ApplicationController
  def index
    if current_user.admin.to_s == "true"
      @todos = Todo.all.order(:priority)
    else
      @todos = Todo.where(:user_id => current_user.id).order(:priority)
    end
  end

  def new
    @todo = Todo.new(user_id: current_user.id)
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Task #{@todo.name} successfuly created!"
      redirect_to todos_url
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
        flash[:notice] = "Task #{@todo.name} successfuly updated!"
        format.html {redirect_to todos_url}
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
      flash[:notice] = "Task deleted!"
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
      :name, :user_id, :finished, :priority
    )
  end
end