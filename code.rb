
class Ingredient
  SAFE_FOODS = ["brussels sprouts","spinach","eggs","milk","tofu",
    "seitan","bell peppers","quinoa","kale","chocolate","beer",
    "wine","whiskey"]
  def initialize(quantity,unit,name)
    @quantity = quantity
    @unit = unit
    @name = name
  end
  def check?
    SAFE_FOODS.include?(@name.downcase)
  end
  def summary
    "#{@quantity}, #{@unit}, #{@name}"
  end
  def self.parse(string)
    array = string.split(' ')
    quantity = array[0]
    unit = array [1]
    name = array[2..-1].join(' ')
    puts "#{quantity}, #{unit}, #{name}"
  end
end
ingredient = Ingredient.new(47.0, "lb(s)", "Brussels Sprouts")
ingredient.summary
ingredient.check?
class Recipe
  def initialize(name,instructions,ingredients)
    @name = name
    @instructions = instructions
    @ingredients = ingredients
  end

  def list_ingredients
    @ingredients.each do |ingredient|
      puts " - #{ingredient.summary}"
    end
  end

  def step_by_step
    @instructions.each_with_index do |steps,index|
      puts "#{index}. #{steps}"
    end
  end

  def can_eat?
    food_check = []
    @ingredients.each do |ingredient|
      food_check << "#{ingredient.check?}"
    end
    if food_check.uniq == "true"
      puts food_check[0]
    else
      puts 'false'
    end
  end

  def summary
    puts "Name: #{@name}"

    "Ingredients"
    list_ingredients

    "Instructions"
    step_by_step
  end
end
name = "Roasted Brussels Sprouts"

ingredients = [
    Ingredient.new(1.5, "lb(s)", "Brussels sprouts"),
    Ingredient.new(3.0, "tbspn(s)", "Good olive oil"),
    Ingredient.new(0.75, "tspn(s)", "Kosher salt"),
    Ingredient.new(0.5, "tspn(s)", "Freshly ground black pepper")
]

instructions = [
    "Preheat oven to 400 degrees F.",
    "Cut off the brown ends of the Brussels sprouts.",
    "Pull off any yellow outer leaves.",
    "Mix them in a bowl with the olive oil, salt and pepper.",
    "Pour them on a sheet pan and roast for 35 to 40 minutes.",
    "They should be until crisp on the outside and tender on the inside.",
    "Shake the pan from time to time to brown the sprouts evenly.",
    "Sprinkle with more kosher salt ( I like these salty like French fries).",
    "Serve and enjoy!"
    ]
recipe = Recipe.new(name, instructions, ingredients)
recipe.summary
require 'pry'
binding.pry
