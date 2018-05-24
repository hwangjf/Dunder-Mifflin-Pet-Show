class DogsController < ApplicationController
  before_action :get_dog, only: [:show]

  def index
    @dogs = Dog.all.sort_by { |dog| dog.employees.length }.reverse
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def get_dog
    @dog = Dog.find(params[:id])
  end

end
