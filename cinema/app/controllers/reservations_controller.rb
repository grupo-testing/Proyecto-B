class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show
  end

  def schedules
    @date = params[:date]
    @screenings = Movie.find(params[:id]).screenings
    @matine = @screenings.filter{ |s| s.schedule == 0 }
    @tanda = @screenings.filter{ |s| s.schedule == 1 }
    @noche = @screenings.filter{ |s| s.schedule == 2 }
  end

  def schedule
    if params[:screening_id].nil? || params[:date].blank?
      redirect_back(fallback_location: root_path, alert: "Elige la sala")
      return
    end
    screening = Screening.find(params[:screening_id])
    flash[:date] = params[:date]
    redirect_to reservations_new_path screening, date: params[:date], seats: params[:seats]
  end

  def new
    p flash[:date], params[:date]
    @date = params[:date]
    @screening = Screening.find(params[:id])
    @unavailable_seats = @screening.reservations.filter{ |r| r.date == Date.parse(@date) }.map { |r| r.seat_number }
    @seats = params[:seats].to_i
    # create reservation with the screening
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    if params[:seats].nil? || params[:name].blank?
      redirect_back(fallback_location: root_path, alert: params[:seats].nil? ? "Elige los asientos": "Escribe el nombre de la reserva")
      return
    end
    screening = Screening.find(params[:id])
    params[:seats].each do |seat_num|
      screening.reservations.create(seat_number: seat_num, date: params[:date], user_name: params[:name])
    end
    redirect_to root_path, notice: "Reservation was successfully created."
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end
end
