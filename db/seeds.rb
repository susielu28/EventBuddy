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
User.destroy_all

User.create!(
  email: "simon@test.com",
  password: "123456"
)
User.create!(
  email: "lukas@test.com",
  password: "123456"
)
User.create!(
  email: "joao@test.com",
  password: "123456"
)
User.create!(
  email: "rui@test.com",
  password: "123456"
)
User.create!(
  email: "susan@test.com",
  password: "123456"
)
User.create!(
  email: "george@test.com",
  password: "123456"
)
User.create!(
  email: "camilla@test.com",
  password: "123456"
)

Event.destroy_all

event_coordinates = ["52.520008,13.404954", "51.509865,-0.118092", "48.864716,2.349014", "40.730610,-73.935242", "38.736946,-9.142685", "-37.80036998,144.9715749"]
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
  venue: event_data["entities"].first ? event_data["entities"].first["formatted_address"] : "MSG",
  genre: event_data["category"],
  info: event_data["description"],
  user: User.all.sample
)

puts "Event created: #{event.name}"
end
end
end
