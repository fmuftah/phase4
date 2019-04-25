class EmployeesController < ApplicationController
        
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  
  

  def index
     @employees = Employee.alphabetical
  end

  def show
  end

  def new
    @employee = Employee.new
    @employee.build_user
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
  
  def active_employees
    @active_employees = Employee.active.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  def inactive_employees
    @inactive_employees = Employee.inactive.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  def younger_than_18
    @younger_than_18 = Employee.younger_than_18.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  def is_18_or_older
    @is_18_or_older = Employee.is_18_or_older.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  def regulars
    @regulars = Employee.regulars.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  def managers
    @managers = Employee.managers.alphabetical.paginate(page: params[:page]).per_page(10)
  end
  
  def admins
    @admins = Employee.admins.alphabetical.paginate(page: params[:page]).per_page(10)
  end
    
    

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :ssn, :date_of_birth, :phone, :role, :active,  user_attributes: [:id, :email, :password, :_destroy])
  end
  
  def set_employee
    @employee = Employee.find(params[:id])
  end
end
