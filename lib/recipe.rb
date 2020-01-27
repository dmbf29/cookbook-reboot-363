class Recipe
  attr_reader :name, :description, :prep_time

  def initialize(attributes = {}) # hash ALWAYS
    # instance varibles stay inside the instance
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    # if attributes[:done]
    #   @done = attributes[:done]
    # else
    #   @done = false
    # end
    @done = attributes[:done] || false
  end

  def done?
    @done
  end

  def mark_as_done!
    @done = true
  end
end

# p Recipe.new
# # # => empty
# p Recipe.new(done: true)
# => @name
