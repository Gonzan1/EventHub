puts "Cleaning database..."
Registration.destroy_all
Review.destroy_all
Event.destroy_all
Venue.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating Categories..."
# Aquí guardamos cada categoría en su propia variable (tech, sports, etc.)
tech = Category.create!(name: 'Academic', description: 'Seminars, lectures, and academic workshops.')
sports = Category.create!(name: 'Sports', description: 'Tournaments, friendly matches, and fitness.')
social = Category.create!(name: 'Social', description: 'Parties, networking, and casual gatherings.')
arts = Category.create!(name: 'Arts & Culture', description: 'Concerts, exhibitions, and theater.')
esports = Category.create!(name: 'eSports & Gaming', description: 'Video game tournaments and board game nights.')

puts "Creating Venues..."
# Lo mismo para los lugares
auditorium = Venue.create!(name: 'Main Auditorium', location: 'Building A, 1st Floor', capacity: 200)
cancha = Venue.create!(name: 'Sports Center', location: 'Campus West', capacity: 50)
lounge = Venue.create!(name: 'Student Lounge', location: 'Building C, Ground Floor', capacity: 30)
lab_comp = Venue.create!(name: 'Computer Lab 3', location: 'Building B, 2nd Floor', capacity: 25)
online = Venue.create!(name: 'Discord Server', location: 'Online', capacity: 100)

puts "Creating users..."
admin = User.create!(email: 'admin@eventhub.cl', encrypted_password: 'password123', role: :admin)
gonzalo = User.create!(email: 'gsalinas@miuandes.cl', encrypted_password: 'password123', role: :regular)
fer = User.create!(email: 'fernanda@miuandes.cl', encrypted_password: 'password123', role: :regular)
seba = User.create!(email: 'sebastian@miuandes.cl', encrypted_password: 'password123', role: :regular)

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

# Como este evento ya está 'completed', usamos save(validate: false) 
# para forzar la inscripción en la base de datos simulando el pasado.
gym_reg = Registration.new(user: gonzalo, event: event_gym, status: :confirmed)
gym_reg.save(validate: false)

puts "Creating reviews..."
# Reviews can only be left on completed events
Review.create!(user: gonzalo, event: event_gym, rating: 5, comment: 'Excellent training, the strength routine was very well structured.')

puts "Database seeded successfully!"