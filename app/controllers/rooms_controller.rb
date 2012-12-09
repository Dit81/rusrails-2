class RoomsController < ApplicationController

  def index
    @rooms = Room.all
  end


  def new
    @room = Room.new
  end


  def create

    @room = Room.new(params[:room])

      if @room.save
        redirect_to :action => :show, :id => @room.id
      else
        render 'new'
      end
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])

    if @room.update_attributes(params[:post])
      redirect_to :action => :show, :id => @room.id
    else
      render 'edit'
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    redirect_to :action => :index
  end


end