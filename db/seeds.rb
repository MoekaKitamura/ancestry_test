# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# europe = Place.create(name: 'ヨーロッパ')
# north_america = Place.create(name: '北米')
# south_america = Place.create(name: '中南米')
# asia = Place.create(name: 'アジア')
# oceania = Place.create(name: 'オセアニア')
# middle_east_asia = Place.create(name: '中近東')
# africa = Place.create(name: 'アフリカ')

# japan, korea, china, malaysia = asia.children.create(
#   [
#     { name: '日本' },
#     { name: '韓国' },
#     { name: '中国' },
#     { name: 'マレーシア' }
#   ]
# )

# ['福岡', '東京', '大阪', '沖縄', '富山'].each do |name|
#   japan.children.create(name: name)
# end

# ['ソウル', '釜山'].each do |name|
#   korea.children.create(name: name)
# end

# %w[北京 上海].each do |name|
#   china.children.create(name: name)
# end

# ['クアラルンプール', 'マラッカ', 'ペナン'].each do |name|
#   malaysia.children.create(name: name)
# end

# america, canada = north_america.children.create(
#   [
#     { name: 'アメリカ' },
#     { name: 'カナダ' },
#   ]
# )

# ['サンディエゴ', 'ニューヨーク', 'ロサンゼルス', 'ボストン'].each do |name|
#   america.children.create(name: name)
# end

# ['トロント', 'バンクーバー', 'オタワ'].each do |name|
#   canada.children.create(name: name)
# end
# --------------------------------------------------------

# regions = %w[
  #   インド洋地域
  #   オセアニア
  #   ロシア
#   中央アジア
#   中央アフリカ
#   中央アメリカ
#   中東
#   北アフリカ
#   北アメリカ
#   北ヨーロッパ
#   南アジア
#   南アフリカ
#   南アメリカ
#   南極
#   地中海地域
#   東アジア
#   東アフリカ
#   東ヨーロッパ
#   東南アジア
#   西アフリカ
#   西ヨーロッパ
# ]

# regions.each do |region|
#   Place.create(name: region)
# end

require "csv"

CSV.foreach('db/region.csv', headers: true) do |row|
  Place.create(
    name: row['name_jp'],
    # name_en: row['name_en'],
  )
end

@parents = Place.where(ancestry: nil)
  
CSV.foreach('db/country.csv', headers: true) do |row|
  region = row['region']
  parent = @parents.find_by(name: region)
    parent.children.create(
    name: row['name_jp'],
    # name_en: row['name_en'],
    # code: row['code'],
    )
end

  # 親 21
  # 子 249 = 270

@children = Place.first.root.children

CSV.foreach('db/city.csv', headers: true) do |row|
  country = row['country']
  child = Place.find_by(name: country)
    child.children.create(
    name: row['name_jp'],
    # name_en: row['name_en'],
    )
end

  # 孫 2 = 272