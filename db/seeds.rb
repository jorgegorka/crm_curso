# -*- encoding : utf-8 -*-
Faker::Config.locale = "en"

Item.delete_all
Comment.delete_all
Task.delete_all
Category.delete_all
Person.delete_all
Company.delete_all
User.delete_all

cities     = ["Madrid", "Logroño", "Calahorra", "Arnedo"]
titles     = %W{Jefecillo Director Lacayo Esclavo}
categories = %W{Email LLamada Reunión Visita}

jorge = User.create!(
  :name                  => "Jorge Alvarez",
  :email                 => 'jorge@alvareznavarro.es',
  :password              => '111111',
  :password_confirmation => "111111",
  :level                 => 99
)
jorge.activate!

7.times do
  User.create!(
  :name                  => Faker::Name.name,
  :email                 => Faker::Internet.email,
  :password              => '111111',
  :password_confirmation => "111111",
  :level                 => 1
  ).activate!
end

23.times do
  Company.create!(
    :name    => Faker::Company.name
  )
end

123.times do
  cmmt = Company.order("rand()").first.comments.new(
    :details => Faker::Lorem.sentence(rand(100))
  )
  cmmt.user = User.order("rand()").first
  cmmt.save!
  
end

155.times do
  Company.order("rand()").first.people.create!(
    :name    => Faker::Name.name,
    :details => Faker::Lorem.sentence(rand(100)),
    :title   => titles.sort_by { rand }[0]
  )
end

123.times do
  cmmt = Person.order("rand()").first.comments.new(
    :details => Faker::Lorem.sentence(rand(100))
  )
  cmmt.user = User.order("rand()").first
  cmmt.save!
end

categories.each do |category|
  Category.create!(
    :name => category
  )
end

153.times do
  User.order("rand()").first.tasks.create!(
    :title       => Faker::Lorem.sentence(rand(10)),
    :finished_on => rand(69).days.from_now,
    :public      => rand(2),
    :category_id => Category.order("rand()").first.id
  )
end

89.times do
  cmmt = Task.order("rand()").first.comments.new(
    :details => Faker::Lorem.sentence(rand(100))
  )
  cmmt.user = User.order("rand()").first
  cmmt.save!
end

89.times do
  Task.order("rand()").first.items.create!(
    :title     => Faker::Company.bs,
    :position  => rand(20),
    :completed => rand(2)
  )
end