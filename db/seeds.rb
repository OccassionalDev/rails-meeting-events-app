# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_account = User.create(first_name: 'John', last_name: 'Smith', email: 'js@js.com', password: 'js123', password_confirmation: 'js123')
second_account = User.create(first_name: 'Demo', last_name: 'Test', email: 'demo@demo.com', password: 'test123', password_confirmation: 'test123')

first_account.events.create(
    title: 'Coding Seminar', 
    description: 'Learn how to code at this event!',
    address: "102 Something St.", 
    start_time: "15:00",  
    date: "2020-05-28", 
    end_time: "16:00"
)

first_account.events.create(
    title: 'Frameworks Seminar', 
    description: 'Learn about certain frameworks at this event!',
    address: "102 Something St.", 
    start_time: "16:00",  
    date: "2020-05-28", 
    end_time: "17:00"
)