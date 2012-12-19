class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create

      @user = Room.new(params[:user])

        if @user.save  # Обработка успешного сохранения.
          redirect_to :action => :show, :id => @user.id
        else
          render 'new'
        end
  end




  def new
    @user = User.new
    @title = "Регистрация"
  end



def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])

  if @user.update_attributes(params[:user])
    redirect_to :action => :show, :id => @user.id
  else
    render 'edit'
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy

  redirect_to :action => :index
end


end
