class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end
  
  def show
  # binding.pry
  @recipe = Recipe.find(params[:id])
    
  end
  
  def new
    @recipe = Recipe.new
  end
  
  def create
    # binding.pry
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(3)
    
    if @recipe.save
      flash[:success] = "Your Recipe was created successfully!"
      redirect_to recipes_path
    else
      render :new
    end
  end
  
  def edit
    @recipe = Recipe.find(params[:id])
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.chef = Chef.find(3)
    
    if @recipe.update(recipe_params)
      flash[:success] = "Your Recipe was edited successfully!"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end
  
  private
    #for white list
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end
end
