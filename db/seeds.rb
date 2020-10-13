# Accounts
first_user = User.create(name: 'John Smith', email: 'js@js.com', password: 'js123', password_confirmation: 'js123')
second_user = User.create(name: 'Demo Test', email: 'demo@demo.com', password: 'test123', password_confirmation: 'test123')
third_user = User.create(name: 'Jane Doe', email: 'ja@ja.com', password:'ja123', password_confirmation: 'ja123')

# Events
first_user.events.create(
    title: 'Coding Seminar', 
    description: 'Learn how to code at this event!',
    address: '02 Something St.', 
    start_time: '15:00',  
    date: (Date.today + 8).to_s, 
    end_time: '16:00'
)

first_user.events.create(
    title: 'Frameworks Seminar', 
    description: 'Learn about certain frameworks at this event!',
    address: '102 Something St.', 
    start_time: '16:00',  
    date: (Date.today + 16).to_s, 
    end_time: '17:00'
)

first_user.events.create(
    title: 'Angular Seminar', 
    description: 'Learn about angular js at this event!',
    address: '108 Something St.', 
    start_time: '16:00',  
    date: (Date.today).to_s, 
    end_time: '17:00'
)

second_user.events.create(
    title: 'Guided Meditation',
    description: 'Get a guided meditation experince through this event!',
    address: '107 Something Ave.',
    date: (Date.today + 1).to_s,
    start_time: '14:00',
    end_time: '14:45'
)

second_user.events.create(
    title: 'Test Event',
    description: 'Test Description',
    address: '107 Area Street.',
    date: (Date.today + 5).to_s,
    start_time: '14:00',
    end_time: '14:45'
)

# Reserve An Event To A Account
second_user.reserved_events << first_user.events.first
second_user.reserved_events << first_user.events.second 
third_user.reserved_events << first_user.events.first

# Create Reviews
second_user.reviews.create(event_id: 1, user_id: second_user.id, rating: 4, content: 'asdf')
third_user.reviews.create(event_id: 1, user_id: third_user.id, rating: 3, content: 'test')