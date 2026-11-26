# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
types = [
  "Animals & Pets",
  "Art",
  "Business & Entrepreneurship",
  "Career & Professional Development",
  "Comedy",
  "Community",
  "Cooking & Baking",
  "Crafts",
  "Dance",
  "Education & Learning",
  "Family & Kids",
  "Fashion",
  "Festivals",
  "Film",
  "Finance",
  "Fitness",
  "Food",
  "Gaming",
  "Gardening",
  "Health & Wellness",
  "History & Heritage",
  "Languages",
  "LGBTQIA+",
  "Literature",
  "Music",
  "Nature & Wildlife",
  "Nightlife",
  "Outdoor & Adventure",
  "Photography",
  "Science",
  "Social & Networking",
  "Social Justice & Activism",
  "Spirituality & Religion",
  "Sports",
  "Sustainability & Environment",
  "Technology",
  "Theatre",
  "Volunteering & Charity",
  "Wine & Beer",
  "Yoga & Meditation"
]

types.each do |name|
  Type.find_or_create_by!(name: name)
end

puts "Created #{Type.count} types"

# Activity 1
activity = Activity.find_or_initialize_by(name: "Line Dance Class")

activity.update!(
  description: "HonkyTonk sur l'Avenue Mont-Royal Est. Whiskey, bières, cocktails et ambiance festive! Cours de danse en ligne & Musique Country 🤠🥃🪩🍺🌵",
  url: "https://botteswhiskey.com/",
  location: "2047 Avenue Du Mont-Royal Est",
  price: 10.00,
  img: "https://img1.wsimg.com/isteam/ip/f2a35b3d-a0c7-45e7-8968-b096cd46a13d/blob-a1569c1.png/:/rs=h:76,cg:true,m/qt=q:95",
  starts_at: "2026-11-27 20:00",
  ends_at: "2026-11-27 22:00",
  types: Type.where(name: ["Dance"])
)

# Activity 2
activity = Activity.find_or_initialize_by(name: "Salsa Night")

activity.update!(
  description: "Join us for a vibrant Salsa night with music, dancing and a great atmosphere.",
  url: "https://example.com/salsa",
  location: "Montreal, Quebec",
  price: 15.00,
  img: "https://placehold.co/600x400",
  starts_at: "2026-11-28 20:00",
  ends_at: "2026-11-28 23:00",
  types: Type.where(name: ["Dance"])
)

# Activity 3
activity = Activity.find_or_initialize_by(name: "Montreal Hiking Meetup")

activity.update!(
  description: "Explore Montreal outdoors with a group of hiking enthusiasts.",
  url: "https://example.com/hiking",
  location: "Mount Royal, Montreal",
  price: 0.00,
  img: "https://placehold.co/600x400",
  starts_at: "2026-11-29 10:00",
  ends_at: "2026-11-29 13:00",
  types: Type.where(name: ["Sport"])
)

# Activity 4
activity = Activity.find_or_initialize_by(name: "Board Games Meetup")

activity.update!(
  description: "Enjoy an afternoon of board games, socializing and meeting new people.",
  url: "https://example.com/boardgames",
  location: "Montreal, Quebec",
  price: 5.00,
  img: "https://placehold.co/600x400",
  starts_at: "2026-11-29 14:00",
  ends_at: "2026-11-29 17:00",
  types: Type.where(name: ["Social"])
)
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
