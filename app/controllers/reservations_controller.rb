class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def confirm
  end

  def create
    @room = Room.find(params[:room_id])
    @reservation = @room.reservations.new(reservation_params)
    @reservation.user = current_user

    start_date = Date.parse(reservation_params[:start_date])
    end_date = Date.parse(reservation_params[:end_date])
    days = (end_date - start_date).to_i
    
    @reservation.total = @room.price * days * @reservation.num_user

    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to "/reservations"
    else
      flash.now[:alert] = "予約に失敗しました"
      @room = Room.find(reservation_params[:room_id])
      render "rooms/show", status: :unprocessable_entity
    end
  end

  def destroy
    @room = Room.find(params[:room_id])
    @reservation = @room.reservation.find(params[:id])
    @reservation.destroy
    flash[:alert] = "予約を削除しました"
    redirect_to :index
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :num_user)
  end
end
