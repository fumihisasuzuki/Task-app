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


# タスクをまとめて作成。
3.times do |m|
  50.times do |n|
    name = "User#{m+1}のタスク#{n+1}"
    note = "User#{m+1}のタスク#{n+1}の詳細（5文字以上）"
    Task.create!(name: name, note: note, user_id: m+1)
  end
end
