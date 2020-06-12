require 'rails_helper'

RSpec.describe "Books", type: :system do
  let!(:user) { create(:user) }
  let!(:book) { create(:book) }

  describe "#index" do
    before do
      visit books_path
    end

    it "「title」「作成主」「更新日時」が表示されている" do
      within ".section" do
        expect(page).to have_content book.user.username
        expect(page).to have_content book.title
        expect(page).to have_content book.updated_at.strftime("%Y-%m-%d %H:%M").to_s
      end
    end

    it "usernameクリック時マイページへ移動" do
      sign_in user
      within ".media-content" do
        click_on book.user.username
        expect(page).to have_current_path(user_path(book.user))
      end
    end

    it "book.titleクリック時、書籍詳細画面移動" do
      sign_in user
      within ".card-content" do
        click_on book.title
        expect(page).to have_current_path(book_path(book))
      end
    end
  end

  describe "#show" do
    before do
      sign_in user
      visit book_path(book)
    end
  end
end
