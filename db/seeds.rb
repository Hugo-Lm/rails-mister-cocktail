# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Creation des 100 ingredients"

ingredients["drinks"].each do |ingredient|
  Ingredient.create({name: ingredient["strIngredient1"]})
end

puts "ingredients créés"

puts "création des cocktails"
cocktailsNew = Cocktail.create([{name: "Caipirinha"}, {name: "Mojito"}, {name: "Cosmopolitan"},{name: "Tequila"}])
puts "cocktails créé"
