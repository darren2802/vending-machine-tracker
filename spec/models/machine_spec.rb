require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
  end

  describe "relationships" do
    it { should have_many :machine_snacks}
    it { should have_many(:snacks).through(:machine_snacks)}
  end

  describe "methods" do
    it 'can display the average price of all snacks at a particular machine' do
      owner = Owner.create(name: "Sam's Snacks")

      dons  = owner.machines.create(location: "Don's Mixed Drinks")
      wills = owner.machines.create(location: "Will's Snack Stop")

      burger = dons.snacks.create(name: 'White Castle Burger', price: 3.50)
      pop_rocks = dons.snacks.create(name: 'Pop Rocks', price: 1.50)
      cheetos = wills.snacks.create(name: 'Flaming Hot Cheetos', price: 2.50)

      expect(dons.avg_snack_price).to eq(2.5)
    end
  end
end
