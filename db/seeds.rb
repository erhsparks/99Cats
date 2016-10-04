# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create(birth_date: Date.today, name: "Fred", color: "red", sex: "M", description: "wow!" )
Cat.create(birth_date: Date.today, name: "Frank", color: "red", sex: "F", description: "fluffy" )
Cat.create(birth_date: Date.today, name: "Fran", color: "green", sex: "M", description: "furry" )
Cat.create(birth_date: Date.today, name: "Foster", color: "green", sex: "F", description: "fast and furrious" )
Cat.create(birth_date: Date.today, name: "Phil", color: "blue", sex: "M", description: "beautiful" )
