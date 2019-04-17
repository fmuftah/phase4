require 'test_helper'

class StoresControllerTest < ActionDispatch::IntegrationTest
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
    get stores_url
    assert_response :success
  end

  test "should get new" do
    get new_store_url
    assert_response :success
  end

  test "should create store" do
    assert_difference('Store.count') do
      post stores_url, params: { store: { active: @ACAC.active, city: @ACAC.city, latitude: @ACAC.latitude, longitude: @ACAC.longitude, name: @ACAC.name, phone: @ACAC.phone, state: @ACAC.state, street: @ACAC.street, zip: @ACAC.zip } }
    end

    assert_redirected_to store_url(Store.last)
  end

  test "should show store" do
    get store_url(@ACAC)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_url(@ACAC)
    assert_response :success
  end

  test "should update store" do
    patch store_url(@ACAC), params: { store: { active: @ACAC.active, city: @ACAC.city, latitude: @ACAC.latitude, longitude: @ACAC.longitude, name: @ACAC.name, phone: @ACAC.phone, state: @ACAC.state, street: @ACAC.street, zip: @ACAC.zip } }
    assert_redirected_to store_url(@ACAC)
  end

  test "should destroy store" do
    assert_difference('Store.count', -1) do
      delete store_url(@ACAC)
    end

    assert_redirected_to stores_url
  end
end
