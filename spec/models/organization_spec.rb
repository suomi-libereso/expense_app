require 'rails_helper'

RSpec.describe Organization, type: :model do
  # 有効なファクトリを持つこと
  it "has a valid factory" do
    expect(FactoryBot.build(:organization)).to be_valid
  end
  # name があれば有効な状態であること
  it "is valid with name" do
    organization = Organization.new(
      name: "テスト株式会社"
      )
      expect(organization).to be_valid
  end
  # name がなければ無効な状態であること
  it "is invalid without a name" do
    organization = FactoryBot.build(:organization, name:nil)
    #organization = Organization.new(name: nil)
    organization.valid?
    expect(organization.errors[:name]).to include("can't be blank")
  end
end
