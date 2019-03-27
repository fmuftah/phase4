class EmployeesControllerController < ApplicationController
        
  before_action :set_employee, only: [:show, :edit, :update, :destroy]


  def index
     @employees = Employee.active.alphabetical.paginate(page: params[:page]).per_page(10)
  end

  def show
  end

  def new
    @employee = Employee.new
  end

  def edit
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to employee_path(@employee), notice: "#{@employee.name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to employee_path(@employee), notice: "#{@employee.name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @employee.destroy
    redirect_to employee_url
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :ssn, :date_of_birth, :phone, :role, :active)
  end
  
  def set_employee
    @employee = Employee.find(params[:id])
  end
end
