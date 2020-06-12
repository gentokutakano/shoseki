require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe "ログインテスト" do
    before do
      visit new_user_session_path
    end

    it "正しいIDが入力された時" do
      within ".login" do
        fill_in "user_email",    with: user.email
        fill_in "user_password", with: user.password
      end
      click_button "ログイン"
      expect(page).to have_content "Signed in successfully"
    end

    it "空のIDが入力された時" do
      within ".login" do
        fill_in "user_email",    with: ""
        fill_in "user_password", with: ""
      end
      click_button "ログイン"
      expect(page).to have_content "Invalid Email or password."
    end
  end

  describe "登録テスト" do
    before do
      visit new_user_registration_path
    end

    it "正しいIDが入力された時" do
      within ".section" do
        fill_in "user_username",              with: "スペック太郎"
        fill_in "user_email",                 with: "rspec1111@gmail.com"
        fill_in "user_password",              with: "password"
        fill_in "user_password_confirmation", with: "password"
      end
      click_button "登録"
      expect(page).to have_content "Welcome! You have signed up successfully."
    end

    it "空のIDが入力された時" do
      within ".section" do
        fill_in "user_username",              with: ""
        fill_in "user_email",                 with: ""
        fill_in "user_password",              with: ""
        fill_in "user_password_confirmation", with: ""
      end
      click_button "登録"
      expect(page).to have_content "3 errors prohibited this user from being saved:"
      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content "Username can't be blank"
    end
  end

  describe "ログインしていない場合" do
    before do
      visit root_path
    end

    it "#書籍一覧に入れる" do
      click_on "書籍一覧" do
        expect(page).to have_current_path books_path
      end
    end

    it "#読書家一覧に入れる" do
      click_on "読書家一覧" do
        expect(page).to have_current_path users_path
      end
    end
  end
end
