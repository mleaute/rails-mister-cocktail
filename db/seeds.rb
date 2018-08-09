# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

lemon = Ingredient.create!(name: "lemon")
ice = Ingredient.create!(name: "ice")
mint_leave = Ingredient.create!(name: "mint leaves")

surprise = Cocktail.create!(name: "Surprise")
cosmo = Cocktail.create!(name: "Cosmopolitain")
mojito = Cocktail.create!(name: "Mojito")

Dose.create!(description: "6cl", cocktail: surprise, ingredient: lemon)
