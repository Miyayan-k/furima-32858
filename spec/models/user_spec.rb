require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname,email,password,password_confirmation,first_name,last_name,first_kana,last_kana,birthday全てが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上、英数混合かつ同じであれば登録できる' do
        @user.password = 'qwerty1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'emailに@マークがあれば登録できる' do
        @user.email = 'test@test.com'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード(確認)とパスワードの入力が一致しません')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(全角)を入力してください')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(全角)を入力してください')
      end
      it 'first_kanaが空では登録できない' do
        @user.first_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(全角)を入力してください')
      end
      it 'last_kanaが空では登録できない' do
        @user.last_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(全角)を入力してください')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('誕生日を入力してください')
      end
      it 'emailがすでに存在していれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it 'passwordが英数混合でなければ登録できない' do
        @user.password = 'qwerty'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'qwert'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'first_nameが漢字あるいはひらがな以外では登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(全角)は全角漢字あるいは全角ひらがなのみ使用できます')
      end
      it 'last_nameが漢字あるいはひらがな以外では登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前(全角)は全角漢字あるいは全角ひらがなのみ使用できます')
      end
      it 'first_kanaがカタカナ以外では登録できない' do
        @user.first_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(全角)は全角カタカナのみ使用できます')
      end
      it 'last_kanaがカタカナ以外では登録できない' do
        @user.first_kana = '漢字'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前カナ(全角)は全角カタカナのみ使用できます')
      end
    end
  end
end
