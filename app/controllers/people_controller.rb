# -*- encoding : utf-8 -*-
class PeopleController < AdminController
  
  before_filter :find_person, :only => [:show, :edit, :update, :people, :destroy]
  before_filter :load_companies, :only => [:new, :create, :edit, :update]
  
  def create
    @person = Person.new(params[:person])

    if @person.save
      redirect_to(people_url, :success => 'Persona creada correctamente')
    else
      render :action => "new"
    end
  end
  
  def destroy
    @person.destroy
    redirect_to(people_url)
  end
  
  def index
    @people = Person.search_people(params).includes(:company).order("name").paginate(:page => (params[:page] || 1))
  end
  
  def new
    @person = Person.new
  end
  
  def show
    @comments = @person.comments.includes(:user).last_comments.paginate(:page => (params[:page] || 1))
  end
  
  def update
    if @person.update_attributes(params[:person])
      redirect_to(@person, :success => 'Persona actualizada correctamente')
    else
      render :action => "edit"
    end
  end
  
  protected
  
  def find_person
    @person = Person.find(params[:id])
  end
  
  def load_companies
    @companies = Company.order("name").all.collect { |c| [c.name, c.id]}
  end
  
end
