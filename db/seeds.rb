# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Rake::Task['db:reset'].invoke

OrderItem.delete_all
Meal.delete_all
DeliveryOrder.delete_all

10.times do |index|
  Meal.create(
    name: Faker::Food.dish,
    description: Faker::Food.ingredient,
  )
end


5.times do |index|
  @current_order = DeliveryOrder.create(
    order_id: "GO" + rand(0..999).to_s,
    serving_datetime: rand(1.week).seconds.from_now
  )

  rand(1..5).times do
    OrderItem.create(
      delivery_order: @current_order,
      meal: Meal.all.sample,
      quantity: rand(1..100),
      unit_price: rand(100..5000)
    )
  end
end
