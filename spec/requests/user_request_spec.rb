require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "#index" do
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
end
