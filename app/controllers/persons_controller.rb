class PersonsController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @persons = Person.includes(:detail).order(created_at: :desc)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    respond_to do |format|
      if @person.save
        flash[:notice] = "Person successfully created"
        format.html { redirect_to @person}
        format.json { render :create, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :show , status: :ok }
    end
  end

  def edit
  end

  def update
    if @person.update(person_params)
      flash[:notice] = 'Person was successfully updated'
      redirect_to @person
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @person.destroy
      redirect_to persons_url, status: :see_other
    else
      flash[:alert] = "Failed to delete person."
      redirect_to persons_url, status: :unprocessable_entity
    end
  end

  private

  def person_params
    params.require(:person).permit(:name, detail_attributes: [:id, :email, :title, :age, :phone, :_destroy])
  end

  def set_person
    @person = Person.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render status: :not_found, json: { errors: 'Person not found', status: :not_found }
  end

  protected
# TODO: This is bypassing the CSRF protection
  def protect_against_forgery?
    false
  end

end
