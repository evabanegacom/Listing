
30.times do
    Business.create!(
        name: Faker::Company.name,
        email: Faker::Internet.email,
        phone: Faker::PhoneNumber.cell_phone,
        description: Faker::Company.catch_phrase,
        category: Faker::Company.industry,
        pricing: Faker::Number.decimal(l_digits: 3, r_digits: 3),
        state: Faker::Address.state,
        cover_photo: Faker::Avatar.image,
        address: Faker::Address.full_address,
        user_id: 1
    )
end