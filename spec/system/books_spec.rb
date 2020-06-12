require 'rails_helper'

RSpec.describe "Books", type: :system do
  let(:user) { create(:user) }
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
    end

    it "book.titleクリック時、書籍詳細画面移動" do
    end
  end
end
