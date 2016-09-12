require 'test_helper'

class TransportationsControllerTest < ActionController::TestCase
  setup do
    @transportation = transportations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transportations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transportation" do
    assert_difference('Transportation.count') do
      post :create, transportation: { codeid: @transportation.codeid, descr: @transportation.descr, shortcut: @transportation.shortcut }
    end

    assert_redirected_to transportation_path(assigns(:transportation))
  end

  test "should show transportation" do
    get :show, id: @transportation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transportation
    assert_response :success
  end

  test "should update transportation" do
    patch :update, id: @transportation, transportation: { codeid: @transportation.codeid, descr: @transportation.descr, shortcut: @transportation.shortcut }
    assert_redirected_to transportation_path(assigns(:transportation))
  end

  test "should destroy transportation" do
    assert_difference('Transportation.count', -1) do
      delete :destroy, id: @transportation
    end

    assert_redirected_to transportations_path
  end
end
