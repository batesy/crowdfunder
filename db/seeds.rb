# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create!(
  title: "Project 1",
  goal: 100,
  description: "Delicious and Ambitious.",
  end_date: DateTime.parse("09/01/2014 19:00")
)