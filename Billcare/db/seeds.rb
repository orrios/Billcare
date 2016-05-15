# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


1440.times do |i|
  Measurement.create([{value: Faker::Commerce.price, time: Faker::Time.between(1.days.ago, Date.today, :all).utc}])
end
