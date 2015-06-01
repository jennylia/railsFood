require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.new(
    chefname: "Johnny", 
    email: "john@gmail.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef name should be present" do
    @chef.chefname = ""
    assert_not @chef.valid?
  end
  
  test "chef name should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chef name should not be too short" do
    @chef.chefname = "a" * 2
    assert_not @chef.valid?
  end
  
  test "chef email should be present" do
    @chef.email = ""
    assert_not @chef.valid?
  end
  
  test "chef email should not be too long" do
    @chef.email = "a" * 200
    assert_not @chef.valid?
  end
  
  test "chef email should not be too short" do
    @chef.email = "a" * 2
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid address" do
    valid_addresses = %w[user@eee.com R_RDD@adf.com user@gmail.com hi12@hi.co]
    valid_addresses.each do |e|
      @chef.email = e
      assert @chef.valid?, '#{e.inspect} should be valid'
    end
  end
  
  test "email validation should reject invalid address" do
    invalid_addresses = %w[user@.cm R_RDD@ usergmail.com hi12@hi,]
    invalid_addresses.each do |e|
      @chef.email = e
      assert_not @chef.valid?, '#{e.inspect} should be valid'
    end
  end

end