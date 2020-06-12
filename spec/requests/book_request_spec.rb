require 'rails_helper'

RSpec.describe "Books", type: :request do
  describe "レスポンステスト" do
    let(:user) { create(:user) }
    let(:book) { create(:book) }

    context "#index" do
      before do
        get books_path
      end

      it "正常にレスポンスを返す" do
        expect(response).to have_http_status "200"
      end

      it 'indexテンプレートをレンダリングする' do
        expect(response).to render_template :index
      end
    end

    context "#show" do
      before do
        sign_in user
        get book_path(book)
      end

      it "正常にレスポンスを返す" do
        expect(response).to have_http_status "200"
      end

      it 'showテンプレートをレンダリングする' do
        expect(response).to render_template :show
      end
    end

    context "ゲストとして" do
      it "302レスポンスを返す" do
        get book_path(book)
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされる" do
        get edit_user_path(user)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
