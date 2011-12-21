class TasksController < AdminController
  
  before_filter :find_task, :except => [:index, :new, :create]
  
  def create
    @task      = Task.new(params[:task])
    @task.user = current_user
    
    if @task.save
      redirect_to(task_url(@task), :success => 'Tarea creada correctamente')
    else
      render :action => "new"
    end
  end
  
  def index
    @tasks = current_user.tasks.order("finished_on desc").paginate(:page => (params[:page] || 1))
  end
  
  def new
    @task = Task.new
  end
  
  def show
    @items = @task.items.order("position").paginate(:page => (params[:page] || 1))
  end
  
  protected
  
  def find_task
    @task = current_user.tasks.find(params[:id])
  end
end
