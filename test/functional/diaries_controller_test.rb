require 'test_helper'

class DiariesControllerTest < ActionController::TestCase
  setup do
    @diary = diaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:diaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create diary" do
    assert_difference('Diary.count') do
      post :create, :diary => @diary.attributes
    end

    assert_redirected_to diary_path(assigns(:diary))
  end

  test "should show diary" do
    get :show, :id => @diary.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @diary.to_param
    assert_response :success
  end

  test "should update diary" do
    put :update, :id => @diary.to_param, :diary => @diary.attributes
    assert_redirected_to diary_path(assigns(:diary))
  end

  test "should destroy diary" do
    assert_difference('Diary.count', -1) do
      delete :destroy, :id => @diary.to_param
    end

    assert_redirected_to diaries_path
  end
end
