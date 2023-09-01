class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update]


  def index
    @prototypes = Prototype.includes(:user)
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)
    if @prototype.save
      redirect_to prototypes_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
    def update
      @prototype = Prototype.find(params[:id])
      @prototype.update(prototype_params)
        if @prototype.save
           redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
      end

      def destroy
        if @prototype.destroy
          redirect_to root_path
        else
          redirect_to root_path
        end
      end
      

  def edit
    @prototype = Prototype.find(params[:id])
  end
  
    

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    puts params.inspect
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end
  

  def authenticate_user
    unless  current_user == @prototype.user
      redirect_to root_path
    end
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
  end
end
end