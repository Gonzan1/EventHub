puts "Cleaning database..."
Review.destroy_all
Registration.destroy_all
Event.destroy_all
Venue.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating users..."
admin = User.create!(email: 'admin@eventhub.cl', encrypted_password: 'password123', role: :admin)
gonzalo = User.create!(email: 'gsalinas@miuandes.cl', encrypted_password: 'password123', role: :regular)
fer = User.create!(email: 'fernanda@miuandes.cl', encrypted_password: 'password123', role: :regular)
seba = User.create!(email: 'sebastian@miuandes.cl', encrypted_password: 'password123', role: :regular)

puts "Creating categories..."
tech = Category.create!(name: 'Technology & Data Science')
esports = Category.create!(name: 'eSports & Gaming')
sports = Category.create!(name: 'Sports')

puts "Creating venues..."
lab_comp = Venue.create!(name: 'Computer Lab', location: 'UANDES Science Building')
cancha = Venue.create!(name: 'Soccer Field', location: 'UANDES Sports Complex')
online = Venue.create!(name: 'Discord Server', location: 'Online')

puts "Creating events..."
event_ds = Event.create!(
  title: 'Practical Workshop: Clustering in Python',
  description: 'Learn to implement clustering algorithms for data analysis. Basic Python knowledge required.',
  start_date: Time.now + 5.days,
  end_date: Time.now + 5.days + 2.hours,
  capacity: 30,
  status: :published,
  organizer: admin,
  category: tech,
  venue: lab_comp
)

event_cs2 = Event.create!(
  title: 'CS2 Lightning Tournament (Counter-Strike 2)',
  description: '5v5 tournament for the university community. Bring your own mouse.',
  start_date: Time.now + 10.days,
  end_date: Time.now + 10.days + 4.hours,
  capacity: 10,
  status: :published,
  organizer: gonzalo,
  category: esports,
  venue: online
)

event_gym = Event.create!(
  title: 'Low-Impact Cardio and Strength Routine',
  description: 'Group training focused on strength and endurance with no joint impact.',
  start_date: Time.now - 2.days,
  end_date: Time.now - 2.days + 1.hour,
  capacity: 15,
  status: :completed, # This event is completed to test reviews
  organizer: fer,
  category: sports,
  venue: cancha
)

event_draft = Event.create!(
  title: 'Startup Pitch: Business Model Workshop',
  description: 'Workshop to structure ideas for future brands.',
  start_date: Time.now + 20.days,
  end_date: Time.now + 20.days + 2.hours,
  capacity: 25,
  status: :draft, # This event is a draft
  organizer: gonzalo,
  category: tech,
  venue: lab_comp
)

puts "Creating registrations..."
Registration.create!(user: seba, event: event_cs2, status: :confirmed)
Registration.create!(user: fer, event: event_cs2, status: :waitlist)
Registration.create!(user: gonzalo, event: event_gym, status: :confirmed)

puts "Creating reviews..."
# Reviews can only be left on completed events
Review.create!(user: gonzalo, event: event_gym, rating: 5, comment: 'Excellent training, the strength routine was very well structured.')

puts "Database seeded successfully!"