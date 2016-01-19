require 'test_helper'

class BaasControllerTest < ActionController::TestCase
  setup do
    @baa = baas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:baas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create baa" do
    assert_difference('Baa.count') do
      post :create, baa: { signature: @baa.signature, user_id: @baa.user_id }
    end

    assert_redirected_to baa_path(assigns(:baa))
  end

  test "should show baa" do
    get :show, id: @baa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @baa
    assert_response :success
  end

  test "should update baa" do
    patch :update, id: @baa, baa: { signature: @baa.signature, user_id: @baa.user_id }
    assert_redirected_to baa_path(assigns(:baa))
  end

  test "should destroy baa" do
    assert_difference('Baa.count', -1) do
      delete :destroy, id: @baa
    end

    assert_redirected_to baas_path
  end
end
