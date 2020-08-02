require 'rails_helper'
require 'spec_helper'
require 'shop'

describe Shop do 
  describe '#create' do
    context '必要事項が埋まっていないときにエラー表示をするか' do
      it "必要事項が入力されていれば投稿できる" do
        shop = build(:shop)
        expect(shop).to be_valid
      end

      it "imageが空の場合は投稿できない" do
        shop = build(:shop, image: nil)
        shop.valid?
        expect(shop.errors[:image]).to include("を入力してください")
      end

      it "nameが空の場合は投稿できない" do
        shop = build(:shop, name: nil)
        shop.valid?
        expect(shop.errors[:name]).to include("を入力してください")
      end

      it "evaluationが0.5〜5でないと進めない" do
        shop = build(:shop, evaluation: nil)
        shop.valid?
        expect(shop.errors[:evaluation]).to include("は0.5〜5で入力してください")
      end

      it "stationが空の場合は投稿できない" do
        shop = build(:shop, station: nil)
        shop.valid?
        expect(shop.errors[:station]).to include("を入力してください")
      end

      it "moveが空の場合は投稿できない" do
        shop = build(:shop, move: nil)
        shop.valid?
        expect(shop.errors[:move]).to include("を入力してください")
      end

      it "timeが空の場合は投稿できない" do
        shop = build(:shop, time: nil)
        shop.valid?
        expect(shop.errors[:time]).to include("を入力してください")
      end

    end
  end
end
