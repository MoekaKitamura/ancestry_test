# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
area = Place.create(name: 'アジア')
japan, korea, china, malaysia = area.children.create(
  [
    { name: '日本' },
    { name: '韓国' },
    { name: '中国' },
    { name: 'マレーシア' }
  ]
)

['福岡', '東京', '大阪', '沖縄', '富山'].each do |name|
  japan.children.create(name: name)
end

['ソウル', '釜山'].each do |name|
  korea.children.create(name: name)
end

%w[北京 上海].each do |name|
  china.children.create(name: name)
end

['クアラルンプール', 'マラッカ', 'ペナン'].each do |name|
  malaysia.children.create(name: name)

area = Place.create(name: '北米')
america, canada = area.children.create(
  [
    { name: 'アメリカ' },
    { name: 'カナダ' },
  ]
)

['サンディエゴ', 'ニューヨーク', 'ロサンゼルス', 'ボストン'].each do |name|
  america.children.create(name: name)
end

['トロント', 'バンクーバー', 'オタワ'].each do |name|
  canada.children.create(name: name)
end