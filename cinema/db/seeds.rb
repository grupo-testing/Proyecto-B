# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
(1..8).each do |n|
  Room.create(number: n)
end

movie1 = Movie.where(name: 'Spiderman', img: 'https://cloudfront-us-east-1.images.arcpublishing.com/elcomercio/D4IRKEAH7NDKPOMYJ5DMYVMLGA.jpg').first_or_create
movie2 = Movie.where(name: 'Sonic', img: 'https://es.web.img2.acsta.net/pictures/19/11/12/12/25/0815514.jpg').first_or_create

screening_params_m = { first_day: "2021-11-28", last_day: "2021-12-07", schedule: 0}
screening_params_t = { first_day: "2021-11-28", last_day: "2021-12-07", schedule: 1}
screening_params_n = { first_day: "2021-11-28", last_day: "2021-12-07", schedule: 2}

screening_params2_m = { first_day: "2021-11-28", last_day: "2021-12-17", schedule: 0}
screening_params2_t = { first_day: "2021-11-28", last_day: "2021-12-17", schedule: 1}
screening_params2_n = { first_day: "2021-11-28", last_day: "2021-12-17", schedule: 2}

[1,3,5].each do |room|
  movie1.screenings.where(**screening_params_m, room_id: room).first_or_create
end

[5,7].each do |room|
  movie1.screenings.where(**screening_params_t, room_id: room).first_or_create
end

[2,8].each do |room|
  movie1.screenings.where(**screening_params_n, room_id: room).first_or_create
end

[2,4,6,7,8].each do |room|
  movie2.screenings.where(**screening_params2_m, room_id: room).first_or_create
end

[1,3,4].each do |room|
  movie2.screenings.where(**screening_params2_t, room_id: room).first_or_create
end

[6].each do |room|
  movie2.screenings.where(**screening_params2_n, room_id: room).first_or_create
end
