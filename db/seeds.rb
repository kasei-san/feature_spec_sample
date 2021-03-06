# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
1.upto(10) do |i|
  item = Item.create(name: "item_#{i}", price: i*100)
  1.upto(5) do |j|
    item.photos << Photo.create(title: "#{i}_#{j}")
  end
end
