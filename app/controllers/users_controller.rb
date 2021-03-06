class UsersController < ApplicationController
  
  before_filter :authenticate, :only => [:edit, :update]
  before_filter :correct_user, :only => [:edit, :update]

  def index
    @users = User.all
    #@userss = User.find(10)
    #@users = User.paginate(:page => params[:page])
  end

  def show
      @user = User.find(params[:id])
      # ????   @microposts = @user.microposts.paginate(:page => params[:page])
      @microposts = @user.microposts
      @title = @user.name
     # @time = article.created_at.to_s(:ru_datetime)
   end

  def new
    @user = User.new
  end

  def edit
      @user = User.find(params[:id])
      @title = "Edit user"
  end

  def create
     @user = User.new(params[:user])
     if @user.save
       sign_in @user
       flash[:success] = "Welcome to the Sample App!"
       redirect_to @user
     else
       @title = "Sign up"
       render 'new'
     end
   end

  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
        redirect_to @user
      else
        @title = "Edit user"
        render 'edit'
      end
    end

  def destroy
       User.find(params[:id]).destroy
       flash[:success] = "User destroyed."
       redirect_to users_path
    end

     
     
  private

      def admin_user
        redirect_to(root_path) unless current_user.admin?
      end

     def authenticate
       deny_access unless signed_in?
     end
     
     def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
     end 
  
end