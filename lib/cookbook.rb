require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    @last_deleted = nil
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  def mark_as_done(index)
    # find recipe with index
    recipe = @recipes[index]
    # mark
    recipe.mark_as_done!
    # find a way to save to the csv
    save_csv
  end

  private

  def load_csv
    csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      # row = #<CSV::Row "name":"tacos" "description":"made by simon" "prep_time":nil>

      @recipes << Recipe.new(
        name: row['name'],
        description: row['description'],
        prep_time: row['prep_time'],
        done: row['done'] == 'true'
      )
    end
  end

  def save_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      csv << ['name', 'description', 'prep_time', 'done']
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.done?] # one record
      end
    end
  end
end
