[参考サイト](https://pikawaka.com/rails/ancestry)

gem 'ancestry'

$ bundle install

$ rails g model Place name:string ancestry:string

nameに, null: falseつける

$ rails db:migrate

app/models/place.rbに、
```
has_ancestry #このコードを追記
```

seedデータ作成！！
↓
rails db:seed

データが入った！
```
[1] pry(main)> Place.all
  Place Load (0.6ms)  SELECT "places".* FROM "places"
=> [#<Place:0x00007ff41518c4f8
  id: 1,
  name: "アジア",
  ancestry: nil,
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416bfca40
  id: 2,
  name: "日本",
  ancestry: "1",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416bfc428
  id: 3,
  name: "韓国",
  ancestry: "1",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c07d78
  id: 4,
  name: "中国",
  ancestry: "1",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c077b0
  id: 5,
  name: "マレーシア",
  ancestry: "1",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c07008
  id: 6,
  name: "福岡",
  ancestry: "1/2",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c06b80
  id: 7,
  name: "東京",
  ancestry: "1/2",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c068b0
  id: 8,
  name: "大阪",
  ancestry: "1/2",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c06630
  id: 9,
  name: "沖縄",
  ancestry: "1/2",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c061a8
  id: 10,
  name: "富山",
  ancestry: "1/2",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c05de8
  id: 11,
  name: "ソウル",
  ancestry: "1/3",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c05c58
  id: 12,
  name: "釜山",
  ancestry: "1/3",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c05988
  id: 13,
  name: "北京",
  ancestry: "1/4",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c05708
  id: 14,
  name: "上海",
  ancestry: "1/4",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c05398
  id: 15,
  name: "クアラルンプール",
  ancestry: "1/5",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
 #<Place:0x00007ff416c05050
  id: 16,
  name: "マラッカ",
  ancestry: "1/5",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>,
  #<Place:0x00007ff416c048d0
  id: 17,
  name: "ペナン",
  ancestry: "1/5",
  created_at: Mon, 11 Oct 2021 13:05:03 JST +09:00,
  updated_at: Mon, 11 Oct 2021 13:05:03 JST +09:00>]
(END)
  ```

Tripテーブル作成。
このデータをどうやってセレクトボックスに使う？？

[参考サイト２](https://qiita.com/Sotq_17/items/120256209993fb05ebac)


