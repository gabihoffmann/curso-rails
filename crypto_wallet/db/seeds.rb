# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Usanod o seeds para criar dados iniciais para o desenvolvimento da aplicação
coin = Coin.create!(
    {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"

    }
)
puts "Criando moeda ..."
coin = Coin.create!(
    {
        description: "DASH",
        acronym: "DASH",
        url_image: "https://media.dash.org/wp-content/uploads/Dash-D-white_on_blue_circle.png"

    }
)
puts "Criando moeda ..."
coin = Coin.create!(
    {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"

    }
)
puts "Criando moeda ..."
puts "Moedas criadas com sucesso"