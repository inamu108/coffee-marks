require 'rails_helper'
require 'spec_helper'
require 'devise'

describe User do
  context '必須事項は埋まっていない時にエラー表示をするか'do
    it "必須項目が間違いなく入力されていれば進める"do
      user = build(:user) 
      expect(user).to be_valid
    end

    it "ニックネームがないと進めない"do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "メールアドレスがない場合は進めない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
   
    it "パスワードがない場合は進めない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "パスワードは２回入力しない場合は進めない" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "名字が入力されていないと進めない" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "名前が入力されていないと進めない" do
      user = build(:user, first_name: nil)
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

  end

  context '誤入力時のエラー表示がされるか'do
    it "必須項目が間違いなく入力されていれば進める"do
      user = build(:user)
      expect(user).to be_valid
    end

    it "メールアドレスが誤入力された場合は進めない" do
      user = build(:user, email: %w[user@foo..com user_at_foo,org example.user@foo.
        foo@bar_baz.com foo@bar+baz.com])
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "パスワードが6文字以上でないと進めない" do
      user = build(:user,password: "aaa1",password_confirmation: "aaa1")
      user.valid?
      expect(user.errors[:password]).to include("は6文字以上で入力してください")
    end
    
  end
  
  context "一意性" do
    it "すでに登録されているメールアドレスは登録できない" do
      User.create(
        nickname: "タロウ",
        email: "example@example.com",
        password: "example1",
        password_confirmation: "example1",
        family_name: "山田",
        first_name: "太郎",
      )
      user = User.new(
        nickname: "ハナコ",
        email: "example@example.com",
        password: "example2",
        password_confirmation: "example2",
        family_name: "山田",
        first_name: "花子",
      )
      user.valid?
      expect(user.errors[:email]).to include("はすでに存在します")
    end
  end
end