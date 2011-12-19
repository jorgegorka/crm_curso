# -*- encoding : utf-8 -*-
class CompaniesController < AdminController
  
  before_filter :find_company, :only => [:show, :edit, :update, :people, :destroy]

  def create
    @company = Company.new(params[:company])

    if @company.save
      redirect_to(companies_url, :success => 'Empresa creada correctamente')
    else
      render :action => "new"
    end
  end
  
  def destroy
    @company.destroy
    redirect_to(companies_url)
  end
  
  def edit
    
  end
  
  def index
    @companies = Company.paginate(:page => (params[:page] || 1))
  end
  
  def new
    @company = Company.new
  end
  
  def people
    @people = @company.people.order("name").paginate(:page => (params[:page] || 1))
  end
  
  def show
    @comments = @company.comments.last_comments.paginate(:page => (params[:page] || 1))
  end
  
  def update

    if @company.update_attributes(params[:company])
      redirect_to(@company, :success => 'Compañia actualizada correctamente')
    else
      render :action => "edit"
    end
  end
  
  protected
  
  def find_company
    @company = Company.find(params[:id])
  end
  
end
