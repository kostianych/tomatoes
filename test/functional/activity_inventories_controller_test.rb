require 'test_helper'

class ActivityInventoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_inventories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_inventory" do
    assert_difference('ActivityInventory.count') do
      post :create, :activity_inventory => { }
    end

    assert_redirected_to activity_inventory_path(assigns(:activity_inventory))
  end

  test "should show activity_inventory" do
    get :show, :id => activity_inventories(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => activity_inventories(:one).id
    assert_response :success
  end

  test "should update activity_inventory" do
    put :update, :id => activity_inventories(:one).id, :activity_inventory => { }
    assert_redirected_to activity_inventory_path(assigns(:activity_inventory))
  end

  test "should destroy activity_inventory" do
    assert_difference('ActivityInventory.count', -1) do
      delete :destroy, :id => activity_inventories(:one).id
    end

    assert_redirected_to activity_inventories_path
  end
end
