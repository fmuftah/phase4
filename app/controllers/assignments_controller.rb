class AssignmentsController < ApplicationController
        
  before_action :set_assignment, only: [:show,:edit, :update, :destroy]


  def index
    @assignments = Assignment.chronological
  end

   def show
   end

  def new
    @assignment = Assignment.new
  end

  def edit
  end

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to @assignment, notice: "#{@assignment.employee.proper_name} was added to the system."
    else
      render action: 'new'
    end
  end

  def update
    if @assignment.update(assignment_params)
      redirect_to @assignment, notice: "#{@assignment.employee.proper_name} was revised in the system."
    else
      render action: 'edit'
    end
  end

  def destroy
    @assignment.destroy
    redirect_to assignments_url
  end
  
  def current
    @current = Assignment.current.paginate(page: params[:page]).per_page(10)
  end
    
  def past
    @past = Assignment.past.paginate(page: params[:page]).per_page(10)
  end
  
  def by_employee
    @by_employee = Assignment.by_employee.paginate(page: params[:page]).per_page(10)
  end
  
  def chronological
    @chronological = Assignment.chronological.paginate(page: params[:page]).per_page(10)
  end
  
  def for_store
    @for_store = Assignment.for_store(1)
  end
  
  def for_employee
    @for_employee = Assignment.for_employee(1)
  end
  
  def for_pay_level
    @for_pay_level = Assignment.for_pay_level(1)
  end
  
  def for_role
    @for_role = Assignment.for_role("admin")
  end
  
  def assignment_manager
    @assignment_manager = Assignment.by_store.paginate(page: params[:page]).per_page(15)
  end
  
  
  
  
  
  
  

  private
  
  def assignment_params
    params.require(:assignment).permit(:employee_id, :store_id, :start_date, :end_date, :pay_level)
  end
  
  def set_assignment
    @assignment = Assignment.find(params[:id])
  end



end
