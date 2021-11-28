class MoviesController < ApplicationController
  before_action :set_movie, only: %i[ show edit update destroy ]

  # GET /movies or /movies.json
  def index
    if !flash[:date].nil?
      @date = flash[:date]
      @movies = Movie.all.filter {|m| m.screenings.first.first_day <= Date.parse(@date) && m.screenings.first.last_day >= Date.parse(@date)}
    else
      @date = Date.today
      @movies = Movie.all.filter {|m| m.screenings.first.first_day <= @date && m.screenings.first.last_day >= @date}
    end
  end

  def search_movies
    flash[:date] = params[:date]
    redirect_to root_path
  end

  # GET /movies/1 or /movies/1.json
  def show
    @date = params[:date]
    @matine = @movie.screenings.where(schedule: 0)
    @tanda = @movie.screenings.where(schedule: 1)
    @noche = @movie.screenings.where(schedule: 2)
  end

  def new
  end

  # GET /movies/1/edit
  def edit
  end

  def create
    if params[:matine].nil? && params[:tanda].nil? && params[:noche].nil?
      render :new, status: :unprocessable_entity
      return
    end
    if params[:last_day].blank? || params[:first_day].blank?
      render :new, status: :unprocessable_entity
      return
    end
    if params[:last_day] < params[:first_day]
      render :new, status: :unprocessable_entity
      return
    end

    screenings = Screening.all
    filtered = screenings.select do |s| 
      if s.first_day <= Date.parse(params[:last_day]) && s.last_day >= Date.parse(params[:first_day])
        true
      else
        false
      end
    end
    
    matine = filtered.select{ |s| s.schedule == 0 }.map { |s| s.room_id }
    tanda = filtered.select{ |s| s.schedule == 1 }.map { |s| s.room_id }
    noche = filtered.select{ |s| s.schedule == 2 }.map { |s| s.room_id }
    if !params[:matine].nil? && (matine & params[:matine].map{ |r| get_room r }).length > 0
      render :new, status: :unprocessable_entity
      return
    end
    if !params[:tanda].nil? && (tanda & params[:tanda].map{ |r| get_room r }).length > 0
      render :new, status: :unprocessable_entity
      return
    end
    if !params[:noche].nil? && (noche & params[:noche].map{ |r| get_room r }).length > 0
      render :new, status: :unprocessable_entity
      return
    end

    @movie = Movie.new(name: params[:name], img: params[:img])

    if !@movie.save!
      render :new, status: :unprocessable_entity
      return
    end

    assing_rooms(params[:matine], first_day: params[:first_day], last_day: params[:last_day], schedule: 0)
    assing_rooms(params[:tanda],  first_day: params[:first_day], last_day: params[:last_day], schedule: 1)
    assing_rooms(params[:noche],  first_day: params[:first_day], last_day: params[:last_day], schedule: 2)

    redirect_to root_path, notice: "Movie was successfully created."
  end

  # PATCH/PUT /movies/1 or /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: "Movie was successfully updated." }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1 or /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: "Movie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def assing_rooms rooms_names, screening_params 
      return true if rooms_names.nil?
      rooms_names.each do |room_name|
        room_number = get_room room_name
        screening = @movie.screenings.create(**screening_params, room_id: room_number)
        return false if !screening.valid?
      end
      true
    end

    def get_room room
      rooms_hash = { "sala1" => 1, "sala2" => 2, "sala3" => 3, "sala4" => 4, "sala5" => 5, "sala6" => 6, "sala7" => 7, "sala8" => 8}
      rooms_hash[room]
    end
end
