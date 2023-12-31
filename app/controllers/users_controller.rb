class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new]
  before_action :set_user, only: [:show]
    def index
      @users = User.all
      
    end
  
    def show
      @user = User.find(params[:id])
      @prototypes = @user.prototypes
      @name = @user.name
      @profile = @user.profile
      @occupation = @user.occupation
      @position = @user.position
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end
  
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :profile, :occupation, :position)
    end

    def prototype_params
      params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
    end

    def set_user
      @user = User.find(params[:id])
    end

  
end