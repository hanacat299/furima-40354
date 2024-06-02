require 'rails_helper'

RSpec.describe User, type: :model do

before do
  @user = FactoryBot.create(:user)
end

describe 'ユーザー新規登録' do

 context '新規登録できるとき' do
  it 'nicknameとemail、passwordとpassword_confiramation、seiとmei、kana_seiとkana_mei、birthdayが存在すれば登録できる' do
   expect(@user).to be_valid
  end
end

 context '新規登録できないとき' do
   it 'nicknameが空では登録できない' do
    @user.nickname = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
   end

   it 'emailが空では登録できない' do
    @user.email = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
   end

   it 'passwordが空では登録できない' do
    @user.password = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
   end

   it 'passwoedとpassword_confiramationが不一致では登録できない' do
    @user.password = "123abc"
    @user.password_confirmation = "456def"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
   end

   it 'emailが重複する場合は登録できない' do
    another_user = FactoryBot.build(:user)
    another_user.email = @user.email
    another_user.valid?
    expect(another_user.errors.full_messages).to include("Email has already been taken")
   end

   it 'emailは@を含まないと登録できない' do
    @user.email = "test.com"
    @user.valid?
    expect(@user.errors.full_messages).to include("Email is invalid")
   end

   it 'passwordは5文字以下では登録できない' do
    @user.password = "12abc"
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
   end

   it 'passwordが数字のみでは登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
   end

   it 'passwordが英字のみでは登録できない' do
    @user.password = 'abcdef'
    @user.password_confirmation = 'abcdef'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
  end

   it 'passwordが全角の文字を含んでいると登録できない' do
    @user.password = 'ａｂｃ１２３'
    @user.password_confirmation = @user.password
    @user.valid?
    expect(@user.errors.full_messages).to include('Password must include both letters and numbers')
   end

   it 'seiが空では登録できない' do
    @user.sei = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Sei can't be blank")
   end

   it 'seiに半角文字が含まれていると登録できない' do
    @user.sei = 'Yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include("Sei can't contain half-width characters")
   end


   it 'meiが空では登録できない' do
    @user.mei = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Mei can't be blank")
   end

   it 'meiに半角文字が含まれていると登録できない' do
    @user.mei = 'Taro'
    @user.valid?
    expect(@user.errors.full_messages).to include("Mei can't contain half-width characters")
   end

   it 'kana_seiが空では登録できない' do
    @user.kana_sei = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana sei can't be blank")
   end

   it 'kana_seiにカタカナ以外が含まれていると登録できない' do
    @user.kana_sei = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana sei must be in katakana')
   end

   it 'kana_meiが空では登録できない' do
    @user.kana_mei = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana mei can't be blank")
   end

  it 'kana_meiにカタカナ以外が含まれていると登録できない' do
    @user.kana_mei = 'はなこ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana mei must be in katakana')
   end

   it 'birthdayが空では登録できない' do
    @user.birthday = ""
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
   end
 end

end

end
