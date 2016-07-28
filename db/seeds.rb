User.create(first_name: "Meg", last_name: "C", email: "megemail", password: "megpassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "I've been building things for years. Bikes and cabinets are my specialties.", photo: "meg.jpg")

User.create(first_name: "Alissa", last_name: "Jones", email: "alissaemail", password: "alissapassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "I can knit you a custom pair of pants. Let's trade.", photo: "alissa.jpg")

User.create(first_name: "Mike", last_name: "Jones", email: "mikeemail", password: "mikepassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "Boxing is my hobby. Tambourine is my passion. I've been teaching professional tambourine boxing for 12 years, and currently I've got openings for new students.", photo: "mike.jpg")

User.create(first_name: "Jordan", last_name: "Meyers", email: "jordanemail", password: "jordanpassword", zipcode: 97213, phone: "1234567", rating: nil, bio: "I specialize in organic gardening practices, and permaculture. I also make a mean chocolate chip cookie", photo: "jordan.jpg")

Tag.create(name: food)
Tag.create(name: health)
Tag.create(name: craft)
Tag.create(name: music)
