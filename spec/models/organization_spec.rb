require 'rails_helper'

RSpec.describe Organization, type: :model do
  # name があれば有効な状態であること
  it "is valid with name" do
    organization = Organization.new(
      name: "テスト株式会社"
      )
      expect(organization).to be_valid
  end
  # name がなければ無効な状態であること
  it "is invalid without a name" do
    organization = Organization.new(name: nil)
    organization.valid?
    expect(organization.errors[:name]).to include("can't be blank")
  end
end
