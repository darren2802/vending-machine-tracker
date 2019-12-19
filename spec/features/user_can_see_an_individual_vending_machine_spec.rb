require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end

  it 'they see the names of all the snacks associated with the machine and their prices' do
    owner = Owner.create(name: "Sam's Snacks")

    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    wills = owner.machines.create(location: "Will's Snack Stop")

    burger = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
    pop_rocks = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
    cheetos = wills.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content(burger.name)
    expect(page).to have_content("$#{burger.price.round(2)}")
    expect(page).to have_content(pop_rocks.name)
    expect(page).to have_content(pop_rocks.price)
  end

  it 'they see the average price of all snacks at the machine' do
    owner = Owner.create(name: "Sam's Snacks")

    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    wills = owner.machines.create(location: "Will's Snack Stop")

    burger = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
    pop_rocks = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
    cheetos = wills.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)

    visit machine_path(dons)

    expect(page).to have_content("Average Price: #{dons.avg_snack_price}")
  end
end



# User Story 1 of 3
#
# As a visitor
# When I visit a vending machine show page
# I see the name of all of the snacks associated with that vending machine along with their price

# User Story 2 of 3
#
# As a visitor
# When I visit a vending machine show page
# I also see an average price for all of the snacks in that machine

# Snacks
# * White Castle Burger: $3.50
# * Pop Rocks: $1.50
# * Flaming Hot Cheetos: $2.50
# Average Price: $2.50
