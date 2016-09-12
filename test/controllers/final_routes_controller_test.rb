require 'test_helper'

class FinalRoutesControllerTest < ActionController::TestCase
  setup do
    @final_route = final_routes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:final_routes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create final_route" do
    assert_difference('FinalRoute.count') do
      post :create, final_route: { cusid: @final_route.cusid, ftrdate: @final_route.ftrdate, iswebroute: @final_route.iswebroute, routetype: @final_route.routetype, supid: @final_route.supid, syromenoid: @final_route.syromenoid, trsid: @final_route.trsid }
    end

    assert_redirected_to final_route_path(assigns(:final_route))
  end

  test "should show final_route" do
    get :show, id: @final_route
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @final_route
    assert_response :success
  end

  test "should update final_route" do
    patch :update, id: @final_route, final_route: { cusid: @final_route.cusid, ftrdate: @final_route.ftrdate, iswebroute: @final_route.iswebroute, routetype: @final_route.routetype, supid: @final_route.supid, syromenoid: @final_route.syromenoid, trsid: @final_route.trsid }
    assert_redirected_to final_route_path(assigns(:final_route))
  end

  test "should destroy final_route" do
    assert_difference('FinalRoute.count', -1) do
      delete :destroy, id: @final_route
    end

    assert_redirected_to final_routes_path
  end
end
