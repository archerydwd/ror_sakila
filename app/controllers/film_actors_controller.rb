class FilmActorsController < ApplicationController
  before_action :set_film_actor, only: [:show, :edit, :update, :destroy]

  # GET /film_actors
  # GET /film_actors.json
  def index
    @film_actors = FilmActor.all
  end

  # GET /film_actors/1
  # GET /film_actors/1.json
  def show
  end

  # GET /film_actors/new
  def new
    @film_actor = FilmActor.new
  end

  # GET /film_actors/1/edit
  def edit
  end

  # POST /film_actors
  # POST /film_actors.json
  def create
    @film_actor = FilmActor.new(film_actor_params)

    respond_to do |format|
      if @film_actor.save
        format.html { redirect_to @film_actor, notice: 'Film actor was successfully created.' }
        format.json { render :show, status: :created, location: @film_actor }
      else
        format.html { render :new }
        format.json { render json: @film_actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /film_actors/1
  # PATCH/PUT /film_actors/1.json
  def update
    respond_to do |format|
      if @film_actor.update(film_actor_params)
        format.html { redirect_to @film_actor, notice: 'Film actor was successfully updated.' }
        format.json { render :show, status: :ok, location: @film_actor }
      else
        format.html { render :edit }
        format.json { render json: @film_actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /film_actors/1
  # DELETE /film_actors/1.json
  def destroy
    @film_actor.destroy
    respond_to do |format|
      format.html { redirect_to film_actors_url, notice: 'Film actor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film_actor
      @film_actor = FilmActor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_actor_params
      params.require(:film_actor).permit(:actor_id, :film_id, :last_update)
    end
end
