require 'rails_helper'

RSpec.describe Product, type: :model do
  context "is valid" do
    it "with a name and description" do
      expect(build(:product)).to be_valid
    end

    it "with only a name" do
      expect(build(:product, description: nil)).to be_valid
    end
  end

  context "is invalid" do
    it "without a name" do
      product = build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it "with a duplicate name" do
      create(:product, name: 'Myproduct')
      product = build(:product, name: 'Myproduct')
      product.valid?
      expect(product.errors[:name]).to include("has already been taken")
    end

    it "with a short name" do
      product = build(:product, name: 'Ab')
      product.valid?
      expect(product.errors[:name]).to include("is too short (minimum is 3 characters)")
    end

    it "with a long name" do
      long_name = 'a' * 31
      product = build(:product, name: long_name)
      product.valid?
      expect(product.errors[:name]).to include("is too long (maximum is 30 characters)")
    end
  end
end
