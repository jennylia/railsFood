require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # Set up instant variable
  def setup
    @recipe = Recipe.new(
    name: "chicken parm", 
    summary: "this is the best chicken parm recipe",
    description: "heat oil, add onion, add tomatoe, cook for 20min")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name="aaaaaaaaaaaaaaaaa"
  end
  
  test "name not too short" do
  end
  
  test "summary should be present" do
  end
  
  test "summary length should not be too long" do
  end
  
  test "summary length should not be too short" do
  end
  
  test "description must be present" do
  end
  
  test "description must not be too long" do
  end
  
  test "description must not be too short" do
  end
end