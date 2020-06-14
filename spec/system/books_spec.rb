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

    it "「title」「感想」「作成者」が表示されている" do
      within ".columns" do
        expect(page).to have_content "プロを目指す人のためのRuby入門"
        expect(page).to have_content "Rubyの基本的な機能について幅広く理解できたと思います。"
        expect(page).to have_content "user"
      end
    end

    it "usernameクリック時user詳細画面へ移動" do
      within ".show" do
        click_on "user"
        expect(page).to have_current_path(user_path(book.user))
      end
    end
  end

  describe "#new" do
    before do
      sign_in user
      visit new_book_path
    end

    it "「書籍名」「感想」「写真」の入力欄が表示されている" do
      within ".new" do
        expect(page).to have_content "書籍名"
        expect(page).to have_content "感想"
        expect(page).to have_content "写真"
      end
    end

    it "正しい値が入力された時" do
      within ".new" do
        fill_in "book_title", with: "everyday_rails_rspec"
        fill_in "book_body",  with: "RSpecを使ったRailsの自動テストを説明した技術書です。"
      end
      click_button "投稿"
      expect(page).to have_content "書籍を投稿しました。"
    end

    it "正しい値が入力された時" do
      within ".new" do
        fill_in "book_title", with: ""
        fill_in "book_body",  with: ""
      end
      click_button "投稿"
      expect(page).to have_content "2 errors prohibited this object from being saved: not successfully"
      expect(page).to have_content "Title can't be blank"
      expect(page).to have_content "Body can't be blank"
    end
  end
end
