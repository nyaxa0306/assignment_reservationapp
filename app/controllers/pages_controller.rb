class PagesController < ApplicationController
  def home
    @rooms = Room.all
    
    if params[:address].present?
      @rooms = Room.where("address LIKE ?", "%#{params[:address]}%")
    end 
  end
end
