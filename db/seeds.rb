# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# for place id:

require "uri"
require "json"
require "net/http"

# url = URI("https://api.predicthq.com/v1/places/?q=Nottingham,England")

# https = Net::HTTP.new(url.host, url.port)
# https.use_ssl = true

# request = Net::HTTP::Get.new(url)
# request["Content-Type"] = "application/json"
# request["Authorization"] = "Bearer #{ENV['PREDICTHQ_ACCESS_TOKEN']}"

# response = https.request(request)
# puts response.read_body
# # JSON.parse(response.read_body)
# place_id = response.read_body["results"][0]["id"]

# To grab events for place with specific id (ie. place.scope=…)
puts "Hello"
Message.destroy_all
puts "Messages destroy"
Event.destroy_all
puts "event destroy"
Chatroom.destroy_all
puts "Chatromm destroy"
User.destroy_all
puts "user destroy"

file = URI.open("https://image.gala.de/22580432/t/cC/v4/w1440/r0.6667/-/gary-barlow.jpg")
user = User.new(
    first_name: 'Gary',
    last_name: 'Barlow',
    email: 'gary.barlow@example.com',
    gender: 'male',
    age: 52,
    bio: 'I am a musician who loves attending all sorts of events.',
    organizer: true,
    location: 'London',
    password: '123456'
)
user.photo.attach(io: file, filename: "Gary.png", content_type: "image/png")
user.interest_list.add("community", "performing-arts", "concerts", "festivals", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3387&q=80")
user = User.new(
    first_name: 'Olivia',
    last_name: 'Smith',
    email: 'olivia.smith@example.com',
    gender: 'female',
    age: 28,
    bio: 'I am a software engineer who loves attending tech conferences and meetups.',
    organizer: false,
    location: 'San Francisco',
    password: '123456'
)
user.photo.attach(io: file, filename: "Olivia.png", content_type: "image/png")
user.interest_list.add("conferences", "community")
user.save

file = URI.open("https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: 'Liam',
  last_name: 'Johnson',
  email: 'liam.johnson@example.com',
  gender: 'male',
  age: 35,
  bio: 'I am a marketing professional who enjoys networking events and community gatherings.',
  organizer: true,
  location: 'New York City',
  password: '123456'
)
user.photo.attach(io: file, filename: "Liam.png", content_type: "image/png")
user.interest_list.add("conferences", "expos","community", "performing-arts", "concerts", "festivals", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80")
user = User.new(
  first_name: 'Emma',
  last_name: 'Williams',
  email: 'emma.williams@example.com',
  gender: 'female',
  age: 22,
  bio: 'I am a recent college graduate with a passion for the performing arts.',
  organizer: false,
  location: 'Los Angeles',
  password: '123456'
)
user.photo.attach(io: file, filename: "Emma.png", content_type: "image/png")
user.interest_list.add("conferences","community", "concerts", "festivals")
user.save

file = URI.open("https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80")
user = User.new(
  first_name: 'Noah',
  last_name: 'Brown',
  email: 'noah.brown@example.com',
  gender: 'male',
  age: 30,
  bio: 'I am a graphic designer who loves attending concerts and music festivals.',
  organizer: false,
  location: 'Chicago',
  password: '123456'
)
user.photo.attach(io: file, filename: "Noah.png", content_type: "image/png")
user.interest_list.add("conferences", "expos","community", "performing-arts", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: 'Ava',
  last_name: 'Jones',
  email: 'ava.jones@example.com',
  gender: 'female',
  age: 27,
  bio: 'I am a project manager who enjoys attending expos and trade shows.',
  organizer: true,
  location: 'Houston',
  password: '123456'
)
user.photo.attach(io: file, filename: "Ava.png", content_type: "image/png")
user.interest_list.add("performing-arts", "concerts", "festivals", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1639747280804-dd2d6b3d88ac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: 'Oliver',
  last_name: 'Garcia',
  email: 'oliver.garcia@example.com',
  gender: 'male',
  age: 32,
  bio: 'I am a foodie who loves attending food festivals and culinary events.',
  organizer: false,
  location: 'Philadelphia',
  password: '123456'
)
user.photo.attach(io: file, filename: "Oliver.png", content_type: "image/png")
user.interest_list.add("community", "festivals")
user.save

file = URI.open("https://images.unsplash.com/photo-1508214751196-bcfd4ca60f91?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: 'Sophia',
  last_name: 'Miller',
  email: 'sophia.miller@example.com',
  gender: 'female',
  age: 29,
  bio: 'I am an artist who loves attending art exhibitions and gallery openings.',
  organizer: true,
  location: 'Phoenix',
  password: '123456'
)
user.photo.attach(io: file, filename: "Sophia.png", content_type: "image/png")
user.interest_list.add("conferences", "expos","community", "performing-arts")
user.save

file = URI.open("https://images.unsplash.com/photo-1605993439219-9d09d2020fa5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mzd8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Susan",
  last_name: "Smith",
  email: "susan.smith@example.com",
  gender: "female",
  age: 28,
  bio: "I'm an avid event-goer and love to explore new communities.",
  organizer: false,
  location: "New York, NY",
  password: "123456"
)
  user.photo.attach(io: file, filename: "Susan.png", content_type: "image/png")
  user.interest_list.add("community", "performing-arts", "concerts", "festivals")
  user.save

  file = URI.open("https://images.unsplash.com/photo-1633068587634-4280dabf12ed?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDl8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
  user = User.new(
  first_name: "Michael",
  last_name: "Johnson",
  email: "michael.johnson@example.com",
  gender: "male",
  age: 34,
  bio: "Passionate about sports and outdoor activities. Organizing local events.",
  organizer: true,
  location: "Los Angeles, CA",
  password: "123456"
)
user.photo.attach(io: file, filename: "Michael.png", content_type: "image/png")
user.interest_list.add("conferences", "expos","community", "performing-arts", "concerts", "festivals", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1533689476487-034f57831a58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTd8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
  user = User.new(
  first_name: "Clara",
  last_name: "Martinez",
  email: "clara.martinez@example.com",
  gender: "female",
  age: 29,
  bio: "A food enthusiast who loves attending food festivals and tasting events.",
  organizer: false,
  location: "Chicago, IL",
  password: "123456"
)
user.photo.attach(io: file, filename: "Clara.png", content_type: "image/png")
user.interest_list.add("conferences", "expos","community", "festivals")
user.save

file = URI.open("https://images.unsplash.com/photo-1610261003803-224ee66747e1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTAyfHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "James",
  last_name: "Brown",
  email: "james.brown@example.com",
  gender: "male",
  age: 31,
  bio: "Music lover, always looking for new concerts and live performances.",
  organizer: false,
  location: "Houston, TX",
  password: "123456"
)
user.photo.attach(io: file, filename: "James.png", content_type: "image/png")
user.interest_list.add("concerts", "festivals", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1546422401-ae86d9d58b0d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OTd8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Isabella",
  last_name: "Garcia",
  email: "isabella.garcia@example.com",
  gender: "female",
  age: 27,
  bio: "Enjoys attending conferences and networking events to grow professionally.",
  organizer: false,
  location: "Phoenix, AZ",
  password: "123456"
)
user.photo.attach(io: file, filename: "Isabella.png", content_type: "image/png")
user.interest_list.add("conferences", "expos", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1624298357597-fd92dfbec01d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTIzfHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "William",
  last_name: "Rodriguez",
  email: "william.rodriguez@example.com",
  gender: "male",
  age: 35,
  bio: "Organizes tech meetups and hackathons to build the local tech community.",
  organizer: true,
  location: "Philadelphia, PA",
  password: "123456"
)
user.photo.attach(io: file, filename: "William.png", content_type: "image/png")
user.interest_list.add("conferences",  "concerts", "festivals")
user.save

file = URI.open("https://images.unsplash.com/photo-1559582930-bb01987cf4dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTI2fHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Ethan",
  last_name: "Morris",
  email: "ethan.morris@example.com",
  gender: "male",
  age: 42,
  bio: "Outdoor enthusiast who enjoys hiking and organizing local nature events.",
  organizer: true,
  location: "Denver, CO",
  password: "123456"
)
user.photo.attach(io: file, filename: "Ethan.png", content_type: "image/png")
user.interest_list.add("community", "performing-arts", "concerts", "festivals")
user.save

file = URI.open("https://images.unsplash.com/photo-1505033575518-a36ea2ef75ae?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTM4fHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Grace",
  last_name: "Mitchell",
  email: "grace.mitchell@example.com",
  gender: "female",
  age: 26,
  bio: "Passionate about arts and culture. Attends performing arts and gallery events.",
  organizer: false,
  location: "San Francisco, CA",
  password: "123456"
)
user.photo.attach(io: file, filename: "Grace.png", content_type: "image/png")
user.interest_list.add("conferences", "expos","community", "performing-arts", "concerts", "festivals", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1521806463-65fbb1ab7ff9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTMyfHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Paul",
  last_name: "Perry",
  email: "paul.perry@example.com",
  gender: "male",
  age: 30,
  bio: "Tech-savvy and always eager to learn. Frequently attends conferences and expos.",
  organizer: false,
  location: "Austin, TX",
  password: "123456"
)
user.photo.attach(io: file, filename: "Paul.png", content_type: "image/png")
user.interest_list.add("conferences", "community", "concerts", "festivals", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1618780179533-870736eaea58?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTE2fHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Avery",
  last_name: "Powell",
  email: "avery.powell@example.com",
  gender: "female",
  age: 23,
  bio: "Social butterfly who enjoys attending community gatherings and charity events.",
  organizer: false,
  location: "Miami, FL",
  password: "123456"
)
user.photo.attach(io: file, filename: "Avery.png", content_type: "image/png")
user.interest_list.add("conferences", "expos", "performing-arts", "concerts", "festivals")
user.save

file = URI.open("https://images.unsplash.com/photo-1521341957697-b93449760f30?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTQ3fHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Tim",
  last_name: "Henderson",
  email: "Tim.henderson@example.com",
  gender: "male",
  age: 35,
  bio: "Avid sports fan and participant, loves attending and organizing local sports events.",
  organizer: true,
  location: "Seattle, WA",
  password: "123456"
)
user.photo.attach(io: file, filename: "Tim.png", content_type: "image/png")
user.interest_list.add("conferences","community", "concerts", "festivals", "sports")
user.save

file = URI.open("https://images.unsplash.com/photo-1590955256716-d7676e3efbf1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTUyfHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Charlotte",
  last_name: "Butler",
  email: "charlotte.butler@example.com",
  gender: "female",
  age: 27,
  bio: "Aspiring filmmaker and film enthusiast, attends film festivals and indie screenings.",
  organizer: false,
  location: "Atlanta, GA",
  password: "123456"
)
user.photo.attach(io: file, filename: "Charlotte.png", content_type: "image/png")
user.interest_list.add("conferences", "expos","community", "performing-arts", "concerts", "festivals")
user.save

file = URI.open("https://images.unsplash.com/photo-1623330188314-8f4645626731?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTYwfHxwcm9maWxlJTIwcGljdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60")
user = User.new(
  first_name: "Benjamin",
  last_name: "Simmons",
  email: "benjamin.simmons@example.com",
  gender: "male",
  age: 38,
  bio: "Passionate about environmental causes, organizes and participates in local clean-up events.",
  organizer: true,
  location: "Portland, OR",
  password: "123456"
)
user.photo.attach(io: file, filename: "Benjamin.png", content_type: "image/png")
user.interest_list.add("conferences", "expos","community", "performing-arts", "sports")
user.save

Event.destroy_all

event_coordinates = ["52.520008,13.404954", "51.509865,-0.118092"]
event_coordinates.each do |coordinate|
event_categories = ["conferences", "expos", "community", "performing-arts", "concerts", "festivals", "sports"]
event_categories.each do |category|

url = URI("https://api.predicthq.com/v1/events/?within=20mi@#{coordinate}&active.gte=2023-04-01&active.lte=2023-04-30&category=#{category}&sort=rank")

https = Net::HTTP.new(url.host, url.port)
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Authorization"] = "Bearer #{ENV['PREDICTHQ_ACCESS_TOKEN']}"

response = https.request(request)

event_array = JSON.parse(response.read_body)["results"]

event_array.each do |event_data|
event = Event.create!(
  name: event_data["title"],
  date: DateTime.parse(event_data["start"]).to_date,
  # time: DateTime.parse(event_data["start"]).strftime("%H:%M:%S"),
  venue: event_data["entities"].first ? event_data["entities"].first["formatted_address"] : "Madison Square Garden",
  longitude: event_data["geo"]["geometry"]["coordinates"][0].is_a?(Float) ? event_data["geo"]["geometry"]["coordinates"][0] : event_data["geo"]["geometry"]["coordinates"][0][0][0],
  latitude: event_data["geo"]["geometry"]["coordinates"][0].is_a?(Float) ? event_data["geo"]["geometry"]["coordinates"][1] : event_data["geo"]["geometry"]["coordinates"][0][0][1],
  genre: event_data["category"],
  info: event_data["description"],
  user: User.all.sample,
  price: rand(5..100)
)

puts "Event created: #{event.name}"
end
end
end

User.all.each do |user|
  15.times do
    EventMember.create(
      user: user,
      event: Event.all.sample
    )
  end
end
