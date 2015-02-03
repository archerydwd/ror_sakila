require 'test_helper'

class FilmActorsControllerTest < ActionController::TestCase
  setup do
    @film_actor = film_actors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:film_actors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create film_actor" do
    assert_difference('FilmActor.count') do
      post :create, film_actor: { actor_id: @film_actor.actor_id, film_id: @film_actor.film_id, last_update: @film_actor.last_update }
    end

    assert_redirected_to film_actor_path(assigns(:film_actor))
  end

  test "should show film_actor" do
    get :show, id: @film_actor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @film_actor
    assert_response :success
  end

  test "should update film_actor" do
    patch :update, id: @film_actor, film_actor: { actor_id: @film_actor.actor_id, film_id: @film_actor.film_id, last_update: @film_actor.last_update }
    assert_redirected_to film_actor_path(assigns(:film_actor))
  end

  test "should destroy film_actor" do
    assert_difference('FilmActor.count', -1) do
      delete :destroy, id: @film_actor
    end

    assert_redirected_to film_actors_path
  end
end
