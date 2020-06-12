require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { create(:book) }

  it "有効なファクトリをもつ" do
    expect(FactoryBot.build(:book)).to be_valid
  end

  it "名、メール、パスワードがあれば有効な状態であること" do
    expect(book).to be_valid
  end

  it "書籍名がなければ無効な状態であること" do
    book = Book.new(title: nil)
    book.valid?
    expect(book.errors[:title]).to include "can't be blank"
  end

  it "感想がなければ無効な状態であること" do
    book = Book.new(body: nil)
    book.valid?
    expect(book.errors[:body]).to include "can't be blank"
  end
end
