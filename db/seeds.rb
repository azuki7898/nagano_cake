# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'a@abc.com',
  password: 'aaaaaa'
  )

 Customer.create!(
     [{
       last_name: 'テスト',
       first_name: '太郎',
       last_name_kana: 'テスト',
       first_name_kana: 'タロウ',
       email: 'b@b.com',
       password: 'bbbbbb',
       postal_code: '111111',
       address: '東京都XXX区1-1-1',
       telephone_number: '000000000'
     },
     {
       last_name: 'テスト',
       first_name: '花子',
       last_name_kana: 'テスト',
       first_name_kana: 'ハナコ',
       email: 'c@c.com',
       password: 'cccccc',
       postal_code: '555555',
       address: '神奈川県XXX市5-5-5',
       telephone_number: '5555555555'
     }
     ]
  )

  Address.create!(
    [{
     customer_id: 1,
     name: 'テスト次郎',
     postal_code: '333333',
     address: '東京都XXX区3-3-3'
    },
    {
      customer_id: 2,
      name: 'テスト三郎',
      postal_code: '666666',
      address: '神奈川県XXX市6-6-6'
    }
    ]
    )

  Genre.create!(
    [
      {
        name: 'ケーキ'
      },
      {
        name: 'プリン'
      },
      {
        name: '焼き菓子'
      },
      {
        name: 'キャンディ'
      }
    ]
  )

  Item.create!(
    [
      {
        genre_id: 1,
        name: 'ショートケーキ',
        image: open('app/assets/images/142_refileDownloadImage.png'),
        introduction: 'おいしいケーキ',
        price: 1200,
        is_active: true
      },
      {
        genre_id: 2,
        name: 'カスタードプリン',
        image: open('app/assets/images/142_refileDownloadImage.png'),
        introduction: 'おいしいプリン',
        price: 800,
        is_active: true
      },
      {
        genre_id: 3,
        name: 'クッキー',
        image: open('app/assets/images/142_refileDownloadImage.png'),
        introduction: 'おいしいクッキー',
        price: 200,
        is_active: true
      },
      {
        genre_id: 4,
        name: 'リンゴあめ',
        image: open('app/assets/images/142_refileDownloadImage.png'),
        introduction: 'おいしいあめ',
        price: 100,
        is_active: true
      }
    ]
  )

  Order.create!(
        customer_id: 1,
        postal_code: '111111',
        address: '東京都XXX区1-1-1',
        name: 'テスト花子',
        payment_method: 0,
        postage: 800,
        is_active: 0
  )

  OrderDetail.create!(
    item_id: 1,
    order_id: 1,
    quantity: 1,
    making_status: 0
  )