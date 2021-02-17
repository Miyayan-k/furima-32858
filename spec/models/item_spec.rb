require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '商品が出品出来るとき' do
      it '画像、商品名、説明、カテゴリー、状態、地域、日数、価格全てが入力されていれば出品出来る' do
        expect(@item).to be_valid
      end
      it '価格が300~9999999円の間であれば出品出来る' do
        @item.price = Faker::Number.between(from: 300, to: 9_999_999)
        expect(@item).to be_valid
      end
    end
    context '商品が出品出来ないとき' do
      it '画像がないと出品出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('出品画像が入力されていません。')
      end
      it '商品名が空では出品出来ない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品名が入力されていません。')
      end
      it '商品説明が空では出品出来ない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の説明が入力されていません。')
      end
      it '価格が空では出品出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('価格が入力されていません。')
      end
      it 'カテゴリーを選択しないと出品出来ない' do
        @item.category_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
      end
      it '商品の状態を選択しないと出品出来ない' do
        @item.state_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('商品の状態を選択してください')
      end
      it '配送料の負担を選択しないと出品出来ない' do
        @item.shipping_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
      end
      it '発送元の地域を選択しないと出品出来ない' do
        @item.consignor_area_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
      end
      it '発送までの日数を選択しないと出品出来ない' do
        @item.days_id = '0'
        @item.valid?
        expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
      end
      it '価格が半角数字でないと出品出来ない' do
        @item.price = '３００００円'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は半角数字のみ入力できます')
      end
      it '価格が300~9999999円の間でないと出品出来ない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は300円以上にしてください')
      end
      it 'ユーザーが紐付いていなければ出品出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('ユーザーを入力してください')
      end
    end
  end
end
