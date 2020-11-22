# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts "Destruction des données actuelles"
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all
puts "données détruites"


url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

puts "Creation des 100 ingredients"

ingredients["drinks"].each do |ingredient|
  Ingredient.create({name: ingredient["strIngredient1"]})
end

puts "ingredients créés"

puts "création des 8 cocktails"
Cocktail.create([{name: "Caipirinha"}, {name: "Mojito"}, {name: "Cosmopolitan"},{name: "Tequila"}, {name: "Daikiri"}, {name: "Tahitian"}, {name: "Punch"},{name: "Pina Colada"}])

url = ["https://www.destinationcocktails.fr/wp-content/uploads/2019/11/le_secret_des_cocktails_a_etages-2.jpg","https://img.cuisineaz.com/660x660/2013-12-20/i13864-cocktail-tequila-sunrise.jpg","https://img-3.journaldesfemmes.fr/zCAYuSqJpy8SEKKK4ao5oLaSqRI=/750x/smart/35fab4d44e9c4172b7228794f654ea02/recipe-jdf/10025521.jpg","https://img.cuisineaz.com/660x660/2017-07-28/i131123-mojito-au-thermomix.jpeg"]
Cocktail.all.each do |cocktail|
  file = URI.open(url.sample)
  cocktail.photo.attach(io: file, filename: 'cocktail.jpg', content_type: 'image/jpeg')
end
puts "cocktails créé"

puts "Création des doses"
description = ["un peu de", "quelques gouttes de", "3cl", "2cl", "5cl"]
ingredients_range_id = (Ingredient.first.id..Ingredient.last.id)
Cocktail.all.each do |cocktail|
  number = rand(2...5)
  number.times do
    Dose.create(description: description.sample, ingredient_id: rand(ingredients_range_id), cocktail_id: cocktail.id)
  end
end
puts "doses créées"
