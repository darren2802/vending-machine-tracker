# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


owner = Owner.create(name: "Sam's Snacks")

dons  = owner.machines.create(location: "Don's Mixed Drinks")
wills = owner.machines.create(location: "Will's Snack Stop")

pop_rocks = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
cheetos = wills.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)

barrys = owner.machines.create(location: "Barry's Burrito Base")

burger_dons = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
burger_wills = wills.snacks.create(name: 'White Castle Burger', price: 2.50)
burger_barrys = barrys.snacks.create(name: 'White Castle Burger', price: 5.50)
