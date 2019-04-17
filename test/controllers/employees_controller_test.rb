require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
   setup do
    create_employees
  end

  teardown do
    remove_employees
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post :create, employee: { active: @ben.active, first_name: "Jake", last_name: @ben.last_name, role: "employee", ssn: "010101010", date_of_birth: 19.years.ago.to_date }
  end

    assert_redirected_to employee_url(Employee.last)
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { active: @employee.active, date_of_birth: @employee.date_of_birth, first_name: @employee.first_name, last_name: @employee.last_name, phone: @employee.phone, role: @employee.role, ssn: @employee.ssn } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end
end
