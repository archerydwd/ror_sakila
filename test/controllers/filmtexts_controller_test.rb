require 'test_helper'

class FilmtextsControllerTest < ActionController::TestCase
  setup do
    @filmtext = filmtexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:filmtexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filmtext" do
    assert_difference('Filmtext.count') do
      post :create, filmtext: { description: @filmtext.description, title: @filmtext.title }
    end

    assert_redirected_to filmtext_path(assigns(:filmtext))
  end

  test "should show filmtext" do
    get :show, id: @filmtext
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filmtext
    assert_response :success
  end

  test "should update filmtext" do
    patch :update, id: @filmtext, filmtext: { description: @filmtext.description, title: @filmtext.title }
    assert_redirected_to filmtext_path(assigns(:filmtext))
  end

  test "should destroy filmtext" do
    assert_difference('Filmtext.count', -1) do
      delete :destroy, id: @filmtext
    end

    assert_redirected_to filmtexts_path
  end
end
