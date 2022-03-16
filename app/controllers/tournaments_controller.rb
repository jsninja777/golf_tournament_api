class TournamentsController < ApplicationController
  before_action :set_tournament, only: %i[ show edit update destroy add_player remove_player ]
  before_action :set_player, only: %i[ add_player remove_player ]

  # GET /tournaments or /tournaments.json
  def index
    @tournaments = Tournament.all
  end

  # GET /tournaments/1 or /tournaments/1.json
  def show
  end

  # GET /tournaments/new
  def new
    @tournament = Tournament.new
  end

  # GET /tournaments/1/edit
  def edit
  end

  # POST /tournaments or /tournaments.json
  def create
    @tournament = Tournament.new(tournament_params)

    respond_to do |format|
      if @tournament.save
        format.html { redirect_to tournament_url(@tournament), notice: "Tournament was successfully created." }
        format.json { render :show, status: :created, location: @tournament }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournaments/1 or /tournaments/1.json
  def update
    respond_to do |format|
      if @tournament.update(tournament_params)
        format.html { redirect_to tournament_url(@tournament), notice: "Tournament was successfully updated." }
        format.json { render :show, status: :ok, location: @tournament }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tournament.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournaments/1 or /tournaments/1.json
  def destroy
    @tournament.destroy

    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: "Tournament was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_player
    @tournament.add(@player)
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: "Players was added successfully into tournament." }
      format.json { render :show, status: :created, location: @tournament }
    end
  end

  def remove_player
    @tournament.remove(@player)
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: "Players was removed successfully from tournament." }
      format.json { render :show, status: :created, location: @tournament }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament
      params[:id] ||= params[:tournament_id]
      @tournament = Tournament.find(params[:id])
    end

    def set_player
      @player = Player.find(params[:player_id])
    end

    # Only allow a list of trusted parameters through.
    def tournament_params
      params.require(:tournament).permit(:name, :course, :start_date)
    end
end
