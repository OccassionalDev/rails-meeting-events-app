# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

first_user = User.create(name: 'John Smith', email: 'js@js.com', password: 'js123', password_confirmation: 'js123')
second_user = User.create(name: 'Demo Test', email: 'demo@demo.com', password: 'test123', password_confirmation: 'test123')

first_user.events.create(
    title: 'Coding Seminar', 
    description: 'Learn how to code at this event!',
    address: "102 Something St.", 
    start_time: "15:00",  
    date: "2020-05-28", 
    end_time: "16:00"
)

first_user.events.create(
    title: 'Frameworks Seminar', 
    description: 'Learn about certain frameworks at this event!',
    address: "102 Something St.", 
    start_time: "16:00",  
    date: "2020-05-28", 
    end_time: "17:00"
)

second_user.reserved_events << first_user.events.first
second_user.reviews.create(event_id: 1, user_id: 2, rating: 4, content: "asdf")