class FilmtextsController < ApplicationController
  before_action :set_filmtext, only: [:show, :edit, :update, :destroy]

  # GET /filmtexts
  # GET /filmtexts.json
  def index
    @filmtexts = Filmtext.all
  end

  # GET /filmtexts/1
  # GET /filmtexts/1.json
  def show
  end

  # GET /filmtexts/new
  def new
    @filmtext = Filmtext.new
  end

  # GET /filmtexts/1/edit
  def edit
  end

  # POST /filmtexts
  # POST /filmtexts.json
  def create
    @filmtext = Filmtext.new(filmtext_params)

    respond_to do |format|
      if @filmtext.save
        format.html { redirect_to @filmtext, notice: 'Filmtext was successfully created.' }
        format.json { render :show, status: :created, location: @filmtext }
      else
        format.html { render :new }
        format.json { render json: @filmtext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /filmtexts/1
  # PATCH/PUT /filmtexts/1.json
  def update
    respond_to do |format|
      if @filmtext.update(filmtext_params)
        format.html { redirect_to @filmtext, notice: 'Filmtext was successfully updated.' }
        format.json { render :show, status: :ok, location: @filmtext }
      else
        format.html { render :edit }
        format.json { render json: @filmtext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /filmtexts/1
  # DELETE /filmtexts/1.json
  def destroy
    @filmtext.destroy
    respond_to do |format|
      format.html { redirect_to filmtexts_url, notice: 'Filmtext was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_filmtext
      @filmtext = Filmtext.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def filmtext_params
      params.require(:filmtext).permit(:title, :description)
    end
end
