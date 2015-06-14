class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :like]
  before_action :require_user, except: [:show, :index, :like]
  before_action :require_user_like, only: [:like]
  before_action :require_same_user, only: [:edit, :update]
  
  def index
    # @recipes = Recipe.all.sort_by{|likes| likes.thumbs_up_total}.reverse
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end
  
  def show
  # binding.pry
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    # binding.pry
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user
    
    if @recipe.save
      flash[:success] = "Your Recipe was created successfully!"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @recipe.chef = current_user
    
    if @recipe.update(recipe_params)
      flash[:success] = "Your Recipe was edited successfully!"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  def like
    # binding.pry
    like = Like.create(like: params[:like], chef:current_user, recipe: @recipe)
    
    if like.valid?
     flash[:success] = "Your selection was successful"
      redirect_to :back
    else
      flash[:danger] = "You can only vote once"
      redirect_to :back
    end

  end
  
  private
    #for white list
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture, style_ids: [], ingredient_ids: [])
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
  
  def require_same_user
      if current_user != @recipe.chef
        flash[:danger] = "You can only edit your own Recipe"
        redirect_to root_path
      end
  end
    
  def require_user_like
    if !logged_in?
      flash[:danger] = "you must log in!"
      redirect_to :back
    end
  end

end
