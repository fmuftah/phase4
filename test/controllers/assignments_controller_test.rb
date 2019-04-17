require 'test_helper'

class AssignmentsControllerTest < ActionDispatch::IntegrationTest
   setup do
    create_employees
    create_stores
    create_assignments
  end

  teardown do
    remove_employees
    remove_stores
    remove_assignments
  end

  test "should get index" do
    get assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_assignment_url
    assert_response :success
  end

  test "should create assignment" do
    assert_difference('Assignment.count') do
      post assignments_url, params: { assignment: { employee_id: @CMU.employee_id, end_date: @CMU.end_date, pay_level: @CMU.pay_level, start_date: @CMU.start_date, store_id: @CMU.store_id } }
    end

    assert_redirected_to assignment_url(Assignment.last)
  end

  test "should show assignment" do
    get assignment_url(@CMU)
    assert_response :success
  end

  test "should get edit" do
    get edit_assignment_url(@CMU)
    assert_response :success
  end

  test "should update assignment" do
    patch assignment_url(@CMU), params: { assignment: { employee_id: @CMU.employee_id, end_date: @CMU.end_date, pay_level: @CMU.pay_level, start_date: @CMU.start_date, store_id: @CMU.store_id } }
    assert_redirected_to assignment_url(@CMU)
  end

  test "should destroy assignment" do
    assert_difference('Assignment.count', -1) do
      delete assignment_url(@CMU)
    end

    assert_redirected_to assignments_url
  end
end
