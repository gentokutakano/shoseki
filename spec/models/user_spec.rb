require 'rails_helper'

RSpec.describe User, type: :model do
  it "名、メール、パスワードがあれば有効な状態であること" do
    user = User.new(
      username: "takano",
      email: "gentoku@gmail.com",
      password: "password",
    )
    expect(user).to be_valid
  end

  it "名がなければ無効な状態であること" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include "can't be blank"
  end

  it " メールアドレスがなければ無効な状態であること" do
    user = User.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include "can't be blank"
  end

  it "重複したメールアドレスなら無効な状態であること" do
    User.create(
      username: "gentoku",
      email: "gentoku@gmail",
      password: "password",
    )
    user = User.new(
      username: "takano",
      email: "gentoku@gmail",
      password: "password",
    )
    user.valid?
    expect(user.errors[:email]).to include "has already been taken"
  end
end
