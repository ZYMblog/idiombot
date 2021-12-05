# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
File.open('idioms.txt') do |file|
  Idiom.delete_all
  file.each do |line|
    name, pinyin, description = line.chomp.split("\t")
    p Idiom.create(name: name, pinyin: pinyin, description: description)
  end
end