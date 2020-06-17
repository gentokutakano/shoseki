class HomeController < ApplicationController
  def index
  end

  def new_guest
    user = User.find_or_create_by(email: "guest@example.com", username: "ゲスト") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to books_path, notice: "ゲストユーザーでログインしました。"
  end
end
