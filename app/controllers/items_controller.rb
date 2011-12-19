class ItemsController < ApplicationController
  
  before_filter :find_task
  
  def create
    item      = @task.items.new(params[:item])
    item.save ? flash[:success] = "Item guardado correctamente" : flash[:error] = "No hemos podido guardar el item"
    redirect_to task_url(@task) and return
  end
  
  def sort
    @items = @task.items
    @items.each do |item|
      item.position = params['item'].index(item.id.to_s) + 1
      item.save
    end

    render :nothing => true
  end
  
  protected
  
  def find_task
    @task = current_user.tasks.find(params[:task_id])
  end
end
