require 'test_helper'

class SubteamsControllerTest < ActionController::TestCase
  setup do
    @subteam = subteams(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subteams)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subteam" do
    assert_difference('Subteam.count') do
      post :create, subteam: { end_date: @subteam.end_date, foreseen_end_date: @subteam.foreseen_end_date, name: @subteam.name, start_date: @subteam.start_date }
    end

    assert_redirected_to subteam_path(assigns(:subteam))
  end

  test "should show subteam" do
    get :show, id: @subteam
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subteam
    assert_response :success
  end

  test "should update subteam" do
    put :update, id: @subteam, subteam: { end_date: @subteam.end_date, foreseen_end_date: @subteam.foreseen_end_date, name: @subteam.name, start_date: @subteam.start_date }
    assert_redirected_to subteam_path(assigns(:subteam))
  end

  test "should destroy subteam" do
    assert_difference('Subteam.count', -1) do
      delete :destroy, id: @subteam
    end

    assert_redirected_to subteams_path
  end
end
