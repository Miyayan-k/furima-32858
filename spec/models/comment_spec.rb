require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @comment = FactoryBot.build(:comment, user_id: user.id, item_id: item.id)
  end

  it 'textがないとコメントは保存できない' do
    @comment.text=''
    @comment.valid?
    expect(@comment.errors.full_messages).to include('コメントが入力されていません。')
  end

  it 'ユーザーが紐づいていないとコメントは保存できない' do
    @comment.user = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include('ユーザーを入力してください')
  end
  it '商品が紐づいていないとコメントは保存できない' do
    @comment.item = nil
    @comment.valid?
    expect(@comment.errors.full_messages).to include('商品を入力してください')
  end
end
