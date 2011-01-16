require 'test_helper'

class TodayActivitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:today_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create today_activity" do
    assert_difference('TodayActivity.count') do
      post :create, :today_activity => { }
    end

    assert_redirected_to today_activity_path(assigns(:today_activity))
  end

  test "should show today_activity" do
    get :show, :id => today_activities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => today_activities(:one).to_param
    assert_response :success
  end

  test "should update today_activity" do
    put :update, :id => today_activities(:one).to_param, :today_activity => { }
    assert_redirected_to today_activity_path(assigns(:today_activity))
  end

  test "should destroy today_activity" do
    assert_difference('TodayActivity.count', -1) do
      delete :destroy, :id => today_activities(:one).to_param
    end

    assert_redirected_to today_activities_path
  end
end
