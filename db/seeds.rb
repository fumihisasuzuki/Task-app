# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
              

99.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end



# タスクをひとつずつ作成します。
Task.create!(name: 'タイピングゲーム', note: '朝10分のタイピングゲームを行う。', user_id: '1')
Task.create!(name: 'PDCA報告', note: '朝に書いてしまう。', user_id: '1')
Task.create!(name: '瞑想', note: '出来れば毎朝やりたい', user_id: '1')
