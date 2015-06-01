require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  # Set up instant variable
  def setup
    @chef = Chef.create(chefname: "Bob", email: "bob@gmail.com")
    @recipe = @chef.recipes.build(
    name: "chicken parm", 
    summary: "this is the best chicken parm recipe",
    description: "heat oil, add onion, add tomatoe, cook for 20min")
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "Chef ID should be present for recipes" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name="a" * 101
    assert_not @recipe.valid?
  end
  
  test "name not too short" do
    @recipe.name="a"
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary=""
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary="a" * 201
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
    @recipe.summary= "a" * 9
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description= ""
    assert_not @recipe.valid?
  end
  
  test "description must not be too long" do
    @recipe.description= "a" * 501
    assert_not @recipe.valid?
  end
 
  test "description must not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
end