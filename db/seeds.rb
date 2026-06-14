# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.find_or_create_by!(name: "Frankfurt am Main", code: "FRA")
Airport.find_or_create_by!(name: "München", code: "MUC")
Airport.find_or_create_by!(name: "Hannover", code: "HAJ")
Airport.find_or_create_by!(name: "Stuttgart", code: "STR")
Airport.find_or_create_by!(name: "Berlin Brandenburg", code: "BER")

# @airports = Airport.all.map { |airport| airport.id }
# puts @airports

@airports = Airport.all

50.times do
  dep_a = @airports.sample
  arr_a = dep_a
  arr_a = @airports.sample until dep_a != arr_a

  start_date = Time.new(2026, 6, 1) + rand(0..864000)
  Flight.create(departure_airport: dep_a, arrival_airport: arr_a, duration: Time.at(rand(1800..18000)), departure: start_date)
end

puts "End of seeds.rb reached"
