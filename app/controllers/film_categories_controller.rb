class FilmCategoriesController < ApplicationController
  before_action :set_film_category, only: [:show, :edit, :update, :destroy]

  # GET /film_categories
  # GET /film_categories.json
  def index
    @film_categories = FilmCategory.all
  end

  # GET /film_categories/1
  # GET /film_categories/1.json
  def show
  end

  # GET /film_categories/new
  def new
    @film_category = FilmCategory.new
  end

  # GET /film_categories/1/edit
  def edit
  end

  # POST /film_categories
  # POST /film_categories.json
  def create
    @film_category = FilmCategory.new(film_category_params)

    respond_to do |format|
      if @film_category.save
        format.html { redirect_to @film_category, notice: 'Film category was successfully created.' }
        format.json { render :show, status: :created, location: @film_category }
      else
        format.html { render :new }
        format.json { render json: @film_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /film_categories/1
  # PATCH/PUT /film_categories/1.json
  def update
    respond_to do |format|
      if @film_category.update(film_category_params)
        format.html { redirect_to @film_category, notice: 'Film category was successfully updated.' }
        format.json { render :show, status: :ok, location: @film_category }
      else
        format.html { render :edit }
        format.json { render json: @film_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /film_categories/1
  # DELETE /film_categories/1.json
  def destroy
    @film_category.destroy
    respond_to do |format|
      format.html { redirect_to film_categories_url, notice: 'Film category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_film_category
      @film_category = FilmCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def film_category_params
      params.require(:film_category).permit(:film_id, :category_id, :last_update)
    end
end
