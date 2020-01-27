require_relative 'view'
require_relative 'scrape_recipe_service'

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
    prep_time = @view.ask_for("prep time")
    # recipe = create an instance of a recipe
    recipe = Recipe.new(
      name: name,
      description: description,
      prep_time: prep_time
    )
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

  def import
    # keyword = ask the view for a keyword
    keyword = @view.ask_for("ingredient")
    # create a service object to handle scraping
    # pass the keyword to the service
    recipes = ScrapeRecipeService.new(keyword).call
    # tell the view to display recipes
    @view.display_recipes(recipes)
    # index = ask the view for a recipe to import
    index = @view.ask_for("number you'd like to add").to_i - 1
    # recipe = we need one recipe from recipes using the index
    recipe = recipes[index]
    # send the recipe to the cookbook
    @cookbook.add_recipe(recipe)
  end

  def mark
    # list the recipes
    display
    # ask for index
    index = @view.ask_for('number').to_i - 1
    @cookbook.mark_as_done(index)
  end

  private

  def display
    recipes = @cookbook.all
    @view.display_recipes(recipes)
  end
end
