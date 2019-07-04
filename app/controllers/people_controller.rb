class PeopleController < ApplicationController

  before_action :authenticate_user
  def index
    persons = Person.all
    if persons.count > 0
      render json: persons, status: 200
    else
      render json: 'No person found', status:404
    end
  end

  def show
    person = Person.find(params[:id])
    if person
      render json: person, status: 200
    else
      render json: 'No person found', status: 404
    end
  end

  def create
    person = Person.new(person_params)
    if person.save
      render json: person, status: 200
    else
      render json: {error: person.errors}, status:400
    end
  end

  def update
    person = Person.find(params[:id])
    if person.update_attributes(person_params)
      render json: person, status: 200
    else
      render json: {error: person.errors}, status:400
    end
  end

  def destroy
    person = Person.find(params[:id])
    if person
      person.destroy
      render json: {msg: 'success'}, status: 200
    else
      render json: {error: 'No Person Found with that Id'}, status: 404
    end
  end

  private

    def person_params
      params.permit(:name, :email, :mobile, :address)
    end
end
