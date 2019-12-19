require 'rails_helper'

RSpec.describe 'Snack Show Page' do
  it 'displays the name of that snack with price and locations and avg price' do
    owner = Owner.create(name: "Sam's Snacks")

    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    wills = owner.machines.create(location: "Will's Snack Stop")
    barrys = owner.machines.create(location: "Barry's Burrito Base")

    burger_dons = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
    burger_wills = wills.snacks.create(name: 'White Castle Burger', price: 2.50)
    burger_barrys = barrys.snacks.create(name: 'White Castle Burger', price: 5.50)

    visit snack_path(burger_barrys)

    expect(page).to have_content(burger_barrys.name)
    expect(page).to have_content(burger_barrys.price)

    within("#location-#{dons.id}") do
      expect(page).to have_content(dons.location)
      expect(page).to have_content(dons.kinds_count)
      expect(page).to have_content(dons.avg_snack_price)
    end

    within("#location-#{wills.id}") do
      expect(page).to have_content(wills.location)
      expect(page).to have_content(dons.kinds_count)
      expect(page).to have_content(dons.avg_snack_price)
    end
  end
end

# User Story 3 of 3
#
# As a visitor
# When I visit a snack show page
# I see the name of that snack
#   and I see the price for that snack
#   and I see a list of locations with vending machines that carry that snack
#   and I see the average price for snacks in those vending machines
#   and I see a count of the different kinds of items in that vending machine.
# Example
# Flaming Hot Cheetos
# Price: $2.50
# Locations
# * Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)
# * Turing Basement (2 kinds of snacks, average price of $3.00)
