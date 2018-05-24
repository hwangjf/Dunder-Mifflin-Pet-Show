class EmployeesController < ApplicationController
  before_action :get_employee, only: [:show, :edit, :update, :destroy]
  before_action :get_dogs, only: [:new, :edit]

  def index
    @employees = Employee.all
    if params[:search]
      @employees = Employee.search(params[:search])
    else
      @employees = Employee.all
    end
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)

    if @employee.valid?
      redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to @employee
    else
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def get_employee
    @employee = Employee.find(params[:id])
  end

  def get_dogs
    @dogs = Dog.all
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end
end
