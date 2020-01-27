require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class ScrapeRecipeService
  def initialize(keyword)
    @keyword = keyword
  end

  def call
    # url = build a url for BBC food with keyword
    url = "https://www.bbcgoodfood.com/search/recipes?query=#{@keyword}"
    # html = open the url with open-uri
    html = open(url).read
    # doc = give the html to Nokogiri => objects
    doc = Nokogiri::HTML(html)
    # search the the objects for... node-recipe |recipe_card|
    doc.search('.node-recipe').first(5).map do |recipe_card|
      # get the name, description
      name = recipe_card.search('.teaser-item__title').text.strip
      description = recipe_card.search('.teaser-item__text-content').text.strip
      prep_time = recipe_card.search('.teaser-item__info-item--total-time').text.strip
      # difficulty = recipe_card.search('.teaser-item__info-item--skill-level').text.strip
      # create an instan e of a Recipe and put in array
      Recipe.new(
        name: name,
        description: description,
        prep_time: prep_time
      )
    end
  end
end
