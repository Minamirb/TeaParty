require 'test_helper'

class DiariesControllerTest < ActionController::TestCase
  setup do
    @diary = diaries(:one)
  end

  test "should get index" do
    get :index, :schedule_id => @diary.schedule.to_param
    assert_response :success
    assert_not_nil assigns(:diaries)
  end

  test "should get new" do
    get :new, :schedule_id => @diary.schedule.to_param
    assert_response :success
  end

  test "should create diary" do
    assert_difference('Diary.count') do
      post :create, :schedule_id => @diary.schedule.to_param, :diary => @diary.attributes
    end

    diary = assigns(:diary)
    assert_redirected_to schedule_diary_url(diary.schedule, diary)
  end

  test "should show diary" do
    get :show, :schedule_id => @diary.schedule.to_param, :id => @diary.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :schedule_id => @diary.schedule.to_param, :id => @diary.to_param
    assert_response :success
  end

  test "should update diary" do
    put :update, :schedule_id => @diary.schedule.to_param, :id => @diary.to_param, :diary => @diary.attributes
    diary = assigns(:diary)
    assert_redirected_to schedule_diary_path(diary.schedule, diary)
  end

  test "should destroy diary" do
    assert_difference('Diary.count', -1) do
      delete :destroy, :schedule_id => @diary.schedule.to_param, :id => @diary.to_param
    end

    assert_redirected_to schedule_diaries_path
  end
end
