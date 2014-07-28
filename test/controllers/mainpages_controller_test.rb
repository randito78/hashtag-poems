require 'test_helper'

class MainpagesControllerTest < ActionController::TestCase
  setup do
    @mainpage = mainpages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mainpages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mainpage" do
    assert_difference('Mainpage.count') do
      post :create, mainpage: { Hashtags: @mainpage.Hashtags }
    end

    assert_redirected_to mainpage_path(assigns(:mainpage))
  end

  test "should show mainpage" do
    get :show, id: @mainpage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mainpage
    assert_response :success
  end

  test "should update mainpage" do
    patch :update, id: @mainpage, mainpage: { Hashtags: @mainpage.Hashtags }
    assert_redirected_to mainpage_path(assigns(:mainpage))
  end

  test "should destroy mainpage" do
    assert_difference('Mainpage.count', -1) do
      delete :destroy, id: @mainpage
    end

    assert_redirected_to mainpages_path
  end
end
