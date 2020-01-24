class View
  def display_recipes(recipes)
    # array of INSTANCES
    if recipes.empty?
      puts "No recipes yet 😭"
    else
      recipes.each_with_index do |recipe, index|
        puts "#{index + 1}.) #{recipe.name} "
        puts "-> #{recipe.description}"
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
end
