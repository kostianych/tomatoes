require 'test_helper'

class PomodorosControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pomodoros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pomodoro" do
    assert_difference('Pomodoro.count') do
      post :create, :pomodoro => { }
    end

    assert_redirected_to pomodoro_path(assigns(:pomodoro))
  end

  test "should show pomodoro" do
    get :show, :id => pomodoros(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => pomodoros(:one).to_param
    assert_response :success
  end

  test "should update pomodoro" do
    put :update, :id => pomodoros(:one).to_param, :pomodoro => { }
    assert_redirected_to pomodoro_path(assigns(:pomodoro))
  end

  test "should destroy pomodoro" do
    assert_difference('Pomodoro.count', -1) do
      delete :destroy, :id => pomodoros(:one).to_param
    end

    assert_redirected_to pomodoros_path
  end
end
