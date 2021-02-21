require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @purchase_address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入' do
    context '商品が購入できるとき' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end
      it '建物名は空欄でも保存できること' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end
    end
    context '商品が購入できないとき' do
      it '郵便番号が空では保存できない' do
        @purchase_address.post_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号が入力されていません。')
      end
      it '都道府県が選択されていなければ保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('都道府県を選択してください。')
      end
      it '市区町村が空では保存できない' do
        @purchase_address.city = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('市区町村が入力されていません。')
      end
      it '番地が空では保存できない' do
        @purchase_address.street_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('番地が入力されていません。')
      end
      it '電話番号が空では保存できない' do
        @purchase_address.tel = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号が入力されていません。')
      end
      it '郵便番号にハイフンがないと保存できない' do
        @purchase_address.post_number = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('郵便番号にはハイフンを入れてください。')
      end
      it 'tokenが空では保存できないこと' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('クレジットカード情報が入力されていません。')
      end
      it 'user_idが空では保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('ユーザーが入力されていません。')
      end
      it 'item_idが空では保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('商品が入力されていません。')
      end
      it '電話番号は数字のみでないと登録できないこと' do
        @purchase_address.tel = 'ABCDEFGH'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は半角数字のみ入力できます。')
      end
      it '電話番号は全角数字だと登録できないこと' do
        @purchase_address.tel = '１２３４５６７８９０'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は半角数字のみ入力できます。')
      end
      it '電話番号は12桁以上だと登録できないこと' do
        @purchase_address.tel = '070123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('電話番号は11文字以下に設定して下さい。')
      end
    end
  end
end
