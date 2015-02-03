require 'test_helper'

class FilmsControllerTest < ActionController::TestCase
  setup do
    @film = films(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:films)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create film" do
    assert_difference('Film.count') do
      post :create, film: { description: @film.description, language_id: @film.language_id, last_update: @film.last_update, length: @film.length, rating: @film.rating, release_year: @film.release_year, rental_duration: @film.rental_duration, rental_rate: @film.rental_rate, replacement_cost: @film.replacement_cost, special_features: @film.special_features, title: @film.title }
    end

    assert_redirected_to film_path(assigns(:film))
  end

  test "should show film" do
    get :show, id: @film
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @film
    assert_response :success
  end

  test "should update film" do
    patch :update, id: @film, film: { description: @film.description, language_id: @film.language_id, last_update: @film.last_update, length: @film.length, rating: @film.rating, release_year: @film.release_year, rental_duration: @film.rental_duration, rental_rate: @film.rental_rate, replacement_cost: @film.replacement_cost, special_features: @film.special_features, title: @film.title }
    assert_redirected_to film_path(assigns(:film))
  end

  test "should destroy film" do
    assert_difference('Film.count', -1) do
      delete :destroy, id: @film
    end

    assert_redirected_to films_path
  end
end
