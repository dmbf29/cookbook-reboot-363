require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display
  end

  def create
    # name = ask user for name of recipe
    name = @view.ask_for_name
    # description = ask user for description of recipe
    description = @view.ask_for_description
    # recipe = create an instance of a recipe
    recipe = Recipe.new(name, description)
    # add recipe to cookbook
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # display_recipes
    display_recipes
    # index = ask user for the index
    index = @view.ask_for_index
    # tell the cookbook to delete recipe at index
    @cookbook.remove_recipe(index)
  end

  private

  def display
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end
end
