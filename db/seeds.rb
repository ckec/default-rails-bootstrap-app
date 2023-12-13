# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Airport.delete_all
Flight.delete_all

Airport.create(code: "SFO")
Airport.create(code: "NYC")
Airport.create(code: "SAN")
Airport.create(code: "PSP")
Airport.create(code: "FAT")

Airport.find_each do |departure_airport|
  Airport.find_each do |arrival_airport|
    next if departure_airport == arrival_airport

      Flight.create(
        departure_airport: departure_airport,
        arrival_airport: arrival_airport,
        start_datetime: DateTime.now + rand(0..30).days + rand(0..23).hours + rand(0..59).minutes,
        duration: rand(120..240).to_i
      )
      
  end
end

puts 'DB seeded successfully!'