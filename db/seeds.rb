# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Classification.find_or_create_by(name: '软件')
Classification.find_or_create_by(name: '书籍')
Classification.find_or_create_by(name: '电影')
Classification.find_or_create_by(name: '教育')
Classification.find_or_create_by(name: '游戏')