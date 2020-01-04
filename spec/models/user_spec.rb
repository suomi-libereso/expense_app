require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @organization = Organization.create(name: "テスト株式会社")
    @user = @organization.users.build(
      name: "鈴木花子",
      email: "hanako@example.com",
      password: "password",
      admin: true
      )
  end
  # 以下の条件をクリアすればユーザーは有効
  # name email passwordがある
  # email が unipue 
  # email が 正規表現に合致
  # password が6文字以上
  it "is valid with name,email,password
  and valid email password" do
      expect(@user).to be_valid
  end
  # ファクトリで関連するデータを生成する
  it "generates associated data from a factory" do
      user = FactoryBot.create(:user)
      puts "This user's organization is #{user.organization.inspect}"
      puts "This user is admin:#{user.admin}"
      other_user = FactoryBot.create(:user, :not_admin)
      puts "This user's name #{other_user.name},admin:#{other_user.admin}"
  end
  context "name" do
    # name がなければ無効な状態であること
    it "is invalid without a name" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("can't be blank")
    end
    # name が51文字以上なら無効であること"
    it "is invalid with 51characters name" do
      @user.name = "a"*51
      @user.valid?
      expect(@user.errors[:name]).to include("is too long (maximum is 50 characters)")
    end
  end
  context "email" do
    # email がなければ無効な状態であること
    it "is invalid without a email" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end
    # email が無効な形式なら無効な状態であること
    it "is invalid with invalid emails" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
      invalid_addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.valid?
        expect(@user.errors[:email]).to include("is invalid")
      end
    end
    #email が重複していれば無効であること
    it "is invalid with duplicate email" do
      @user.save
      @other_user = @organization.users.build(
      name: "山田花子",
      email: "hanako@example.com",
      password: "password",
      )
      @other_user.valid?
      expect(@other_user). not_to be_valid
    end
  end
  context "password" do
    #password がなければ無効であること
    it "is invalid without password" do
      @user.password = ""
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end
    #password が5文字以下なら無効であること
    it "is invalid with too short password" do
      @user.password = "a"*5
      @user.valid?
      expect(@user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end
  end
  # userがorganizationに属すること
  it "is invalid without belongs_to organization" do
    @not_belong_user = User.new(
      name: "佐藤一郎",
      email: "ichiro@example.com",
      password: "password",
      )
    @not_belong_user.valid?
    expect(@not_belong_user.errors[:organization]).to include("must exist")
  end
end
