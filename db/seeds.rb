# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# Updated brands
brands = ['Apple', 'Samsung', 'Xiaomi', 'Oppo', 'Vivo']

# Create brands
brand_records = brands.map do |name|
  Brand.create!(name: name)
end

# Updated phone models
phones = {
  'Apple' => ['iPhone 14 Pro', 'iPhone 14', 'iPhone SE 2022'],
  'Samsung' => ['Galaxy S22', 'Galaxy S22+', 'Galaxy A53'],  
  'Xiaomi' => ['Redmi Note 11', 'Xiaomi 12', 'Poco X4 Pro'],
  'Oppo' => ['Oppo Find X5', 'Oppo Reno 8', 'Oppo A76'],
  'Vivo' => ['Vivo V23', 'Vivo Y55', 'Vivo Y15']   
}

# Create phone models 
phones.each do |brand, models|
  brand = Brand.find_by(name: brand)
  
  models.each do |model|
    product = Product.create!(
      title: model,
      description: "The latest #{model} smartphone",  
      price: rand(400..1000),
      brand: brand
    )
    product.photo.attach(io: File.open('public/images/phone.png'), filename: 'phone.png', content_type: 'image/png')
  end
end