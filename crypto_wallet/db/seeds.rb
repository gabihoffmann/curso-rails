# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'tty-spinner'
#Usanod o seeds para criar dados iniciais para o desenvolvimento da aplicação
spinner = TTY::Spinner.new("[:spinner] Cadastrando Moedas...", format: :balloon_2)
spinner.auto_spin

coins = [
    {
        description: "Bitcoin",
        acronym: "BTC",
        url_image: "http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png"

    },

    {
        description: "DASH",
        acronym: "DASH",
        url_image: "https://media.dash.org/wp-content/uploads/Dash-D-white_on_blue_circle.png"

    },

    {
        description: "Ethereum",
        acronym: "ETH",
        url_image: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png"

    },

    {
        description: "Shazam",
        acronym: "SZM",
        url_image: "https://library.kissclipart.com/20180831/zte/kissclipart-shazam-symbol-png-clipart-captain-marvel-black-ada-770a336e34552609.png"
    }
    
]

coins.each do |coin|
    sleep(0.5)
    Coin.find_or_create_by!(coin)
end

spinner.stop("(Cadastrado com sucesso)") 