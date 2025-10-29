class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @rooms = Room.all

    if params[:address].present?
      @rooms = @rooms.where("address LIKE ?", "%#{params[:address]}%")
    end
    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"
      @rooms = @rooms.where("name LIKE ? OR detail LIKE ?", keyword, keyword)
    end
  end

  def myroom
    @rooms = Room.all
  end

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:notice] = "施設を登録しました"
      redirect_to room_path(@room)
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    new_params = room_params

    if @room.update(new_params)
      flash[:notice] = "施設情報を更新しました"
      redirect_to room_path(@room)
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @room.destroy
    flash[:alert] = "施設を削除しました"
    redirect_to :myroom
  end

  private
  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :detail, :price, :address, :image)
  end
end
