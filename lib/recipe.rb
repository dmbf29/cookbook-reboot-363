class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    # instance varibles stay inside the instance
    @name = name
    @description = description
  end
end

# Recipe.new
# => empty
# Recipe.new("pasta")
# => @name
