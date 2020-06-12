require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "認証テスト" do
    let!(:user) { create(:user) }

    context "#index" do
      before do
        get users_path
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
        get user_path(user)
      end

      it "正常にレスポンスを返す" do
        expect(response).to have_http_status "200"
      end

      it 'indexテンプレートをレンダリングする' do
        expect(response).to render_template :show
      end
    end

    context "#ログイン" do
      before do
        get new_user_session_path
      end

      it "正常にレスポンスを返す" do
        expect(response).to have_http_status "200"
      end
    end

    context "#登録" do
      before do
        get new_user_registration_path
      end

      it "正常にレスポンスを返す" do
        expect(response).to have_http_status "200"
      end
    end

    context "#編集" do
      before do
        sign_in user
        get edit_user_path(user)
      end

      it "正常にレスポンスを返す" do
        expect(response).to have_http_status "200"
      end
    end

    context "ゲストとして" do
      it "302レスポンスを返す" do
        get edit_user_path(user)
        expect(response).to have_http_status "302"
      end
      it "ログイン画面にリダイレクトされる" do
        get edit_user_path(user)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
