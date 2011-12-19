class CommentsController < AdminController
  before_filter :find_commenter
  
  def create
    comment      = @commenter.comments.new(params[:comment])
    comment.user = current_user
    comment.save ? flash[:success] = "Comentario guardado correctamente" : flash[:error] = "No hemos podido guardar el comentario"
    redirect_to @commenter_origin and return
    
  end
  
  protected
  
  def find_commenter
    if params[:company_id].present?
      @commenter        = Company.find(params[:company_id])
      @commenter_origin = company_url(@commenter)
    elsif params[:person_id].present?
      @commenter        = Person.find(params[:person_id])
      @commenter_origin = person_url(@commenter)
    elsif params[:task_id].present?
      @commenter        = Task.find(params[:task_id])
      @commenter_origin = task_url(@commenter)
    end
  end
end
