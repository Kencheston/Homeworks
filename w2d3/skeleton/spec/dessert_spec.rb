require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("Ghiradelli", 3, chef) }


  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("Ghiradelli")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(3)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect do
        dessert.quantity = "5"
      end.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("banana")
      expect(dessert.ingredients).to include("banana")
    end
  end

  describe "#mix!" do
    before do
      dessert.add_ingredient("coco")
      dessert.add_ingredient("syrup")
      dessert.add_ingredient("nuts")
    end
    it "shuffles the ingredient array" do
      origin = dessert.ingredients.dup
      dessert.mix!
      expect(dessert.ingredients).not_to eql(origin)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      original = dessert.quantity
      dessert.eat(1)
      expect(dessert.quantity).not_to eql(original)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect do
        dessert.eat(8)
      end.to raise_error
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include("chef")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      #make sure self is called
      #make sure bake is called on chef
      expect(dessert.make_more).to recieve(chef.bake)
    end
  end
end
