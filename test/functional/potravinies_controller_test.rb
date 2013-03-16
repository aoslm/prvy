require 'test_helper'

class PotraviniesControllerTest < ActionController::TestCase
  setup do
    @potraviny = potravinies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:potravinies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create potraviny" do
    assert_difference('Potraviny.count') do
      post :create, potraviny: { : @potraviny. }
    end

    assert_redirected_to potraviny_path(assigns(:potraviny))
  end

  test "should show potraviny" do
    get :show, id: @potraviny
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @potraviny
    assert_response :success
  end

  test "should update potraviny" do
    put :update, id: @potraviny, potraviny: { : @potraviny. }
    assert_redirected_to potraviny_path(assigns(:potraviny))
  end

  test "should destroy potraviny" do
    assert_difference('Potraviny.count', -1) do
      delete :destroy, id: @potraviny
    end

    assert_redirected_to potravinies_path
  end
end
