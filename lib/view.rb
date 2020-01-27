class View
  def display_recipes(recipes)
    # array of INSTANCES
    if recipes.empty?
      puts "No recipes yet 😭"
    else
      recipes.each_with_index do |recipe, index|
        x_mark = recipe.done? ? "X" : " "
        puts "#{index + 1}.) #{recipe.name} Prep: #{recipe.prep_time}"
        puts "[#{x_mark}] -> #{recipe.description}"
      end
    end
  end

  def ask_for_name
    puts "What's the name of the recipe?"
    gets.chomp
  end

  def ask_for_description
    puts "What's the description of the recipe?"
    gets.chomp
  end

  def ask_for_index
    puts "Which number?"
    gets.chomp.to_i - 1
  end

  def ask_for(thing)
    puts "Whats the #{thing}?"
    gets.chomp
  end
end
