# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Activity.find_or_create_by!(name: "Line Dance Class",
  description: "HonkyTonk sur l'Avenue Mont-Royal Est. Whiskey, bières, cocktails et ambiance festive! Cours de danse en ligne & Musique Country 🤠🥃🪩🍺🌵",
  url: "https://botteswhiskey.com/",
  location: "2047 Avenue Du Mont-Royal Est",
  price: 10.00,
  img: "https://img1.wsimg.com/isteam/ip/f2a35b3d-a0c7-45e7-8968-b096cd46a13d/blob-a1569c1.png/:/rs=h:76,cg:true,m/qt=q:95",
  starts_at: "2026-11-27 20:00",
  ends_at: "2026-11-27 22:00")

User.destroy_all

User.create!(
  email: "tommy@lewagon.ca",
  password: "password123",
  password_confirmation: "password123"
)

User.create!(
  email: "kate@lewagon.ca",
  password: "password123",
  password_confirmation: "password123"
)

User.create!(
  email: "greg@lewagon.ca",
  password: "password123",
  password_confirmation: "password123"
)
