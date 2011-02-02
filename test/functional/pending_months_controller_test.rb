require 'test_helper'

class PendingMonthsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pending_months)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pending_month" do
    assert_difference('PendingMonth.count') do
      post :create, :pending_month => { }
    end

    assert_redirected_to pending_month_path(assigns(:pending_month))
  end

  test "should show pending_month" do
    get :show, :id => pending_months(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pending_months(:one).to_param
    assert_response :success
  end

  test "should update pending_month" do
    put :update, :id => pending_months(:one).to_param, :pending_month => { }
    assert_redirected_to pending_month_path(assigns(:pending_month))
  end

  test "should destroy pending_month" do
    assert_difference('PendingMonth.count', -1) do
      delete :destroy, :id => pending_months(:one).to_param
    end

    assert_redirected_to pending_months_path
  end
end
