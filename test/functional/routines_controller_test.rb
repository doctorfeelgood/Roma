require 'rails/test_helper'

class RoutinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:routines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create routine" do
    assert_difference('Routine.count') do
      post :create, :routine => { }
    end

    assert_redirected_to routine_path(assigns(:routine))
  end

  test "should show routine" do
    get :show, :id => routines(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => routines(:one).to_param
    assert_response :success
  end

  test "should update routine" do
    put :update, :id => routines(:one).to_param, :routine => { }
    assert_redirected_to routine_path(assigns(:routine))
  end

  test "should destroy routine" do
    assert_difference('Routine.count', -1) do
      delete :destroy, :id => routines(:one).to_param
    end

    assert_redirected_to routines_path
  end
end
