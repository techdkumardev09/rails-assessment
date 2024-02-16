class PersonsController < ApplicationController
  before_action :set_person, only: [:edit, :update, :destroy]

  def index
    @persons = Person.includes(:detail)
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render :new
    end
  end

  def show
    @person = Person.find(params[:id])
  end

  def edit
  end

  def update
    if @person.update(person_params)
      redirect_to @person, notice: 'Person was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to persons_url, notice: 'Person was successfully destroyed.'
  end

  private

  def person_params
    params.require(:person).permit(:name, detail_attributes: [:id, :email, :title, :age, :phone, :_destroy])
  end

  def set_person
    @person = Person.find(params[:id])
  end
end
