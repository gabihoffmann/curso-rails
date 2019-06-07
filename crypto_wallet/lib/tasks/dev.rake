# frozen_string_literal: true
namespace :dev do
    desc 'Configura o ambiente de desenvolvimento'
    task setup: :environment do
      # mantendo ação apenas no ambiente de desenvolvimento
      if Rails.env.development?
        # %x() permite executar comandos do terminal
        show_spiner('Apagando BD...') {`rails db:drop`}
        show_spiner('Criando BD...') {`rails db:create`}
        show_spiner('Migrando BD...') {`rails db:migrate`}
        %x(rails dev:add_mining_type)
        `rails dev:add_coins`
        
      else
        puts 'Você não está em ambiente de desenvolvimento!'
      end
    end

    desc 'Cadastro de moedas'
    task add_coins: :environment do
      show_spiner('Cadastrando moedas...') do
      coins = [
          {   
            description: 'Bitcoin',
            acronym: 'BTC',
            url_image: 'http://pngimg.com/uploads/bitcoin/bitcoin_PNG47.png',
            mining_type: MiningType.find_by(acronym: "PoW")
          },

          { 
            description: 'DASH',
            acronym: 'DASH',
            url_image: 'https://media.dash.org/wp-content/uploads/Dash-D-white_on_blue_circle.png',
            mining_type: MiningType.all.sample
          },

          {
            description: 'Ethereum',
            acronym: 'ETH',
            url_image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/ETHEREUM-YOUTUBE-PROFILE-PIC.png/600px-ETHEREUM-YOUTUBE-PROFILE-PIC.png',
            mining_type: MiningType.all.sample
          },

          {
            description: 'Shazam',
            acronym: 'SZM',
            url_image: 'https://library.kissclipart.com/20180831/zte/kissclipart-shazam-symbol-png-clipart-captain-marvel-black-ada-770a336e34552609.png',
            mining_type: MiningType.all.sample
          },
          
          {
            description: 'Iota',
            acronym: 'IOT',
            url_image: "",
            mining_type: MiningType.all.sample
          },

          {
            description: 'ZCash',
            acronym: 'ZEC',
            url_image: "",
            mining_type: MiningType.all.sample
          }

      ]

      coins.each do |coin|
          sleep(0.5)
          Coin.find_or_create_by!(coin)
        end
      end
    end

  desc 'Cadastrando os tipos de mineração de moedas'
  task add_mining_type: :environment do
    show_spiner('Cadastrando tipos de mineração...') do
      mining_types = [
        {description: "Proof of Work", acronym: "PoW"},
        {description: "Proof of Stake", acronym: "PoS"},
        {description: "Proof of Capacity",acronym: "PoC"}
      ]

      mining_types.each do |type|
        sleep(0.5)
        MiningType.find_or_create_by!(type)
      end  
    end 
  end
      

  private

  def show_spiner(msg_start = 'Carregando', msg_end = 'Concluido com sucesso!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    # Bloco de Código: https://guru-sp.github.io/tutorial_ruby/blocos-ruby.html
    yield
    spinner.success("(#{msg_end})") # Stop animation
  end
end
