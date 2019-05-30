namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    # mantendo ação apenas no ambiente de desenvolvimento
    if Rails.env.development?
       # %x() permite executar comandos do terminal
      show_spiner("Apagando BD...") do 
        %x(rails db:drop)
      end

      show_spiner("Criando BD...") {%x(rails db:create)} 

      show_spiner("Migrando BD...") do 
        %x(rails db:migrate)
      end
      
      show_spiner("Populando BD...") do 
        %x(rails db:seed)
      end

    else 
      puts "Você não está em ambiente de desenvolvimento!"
    end
  end

  private

  def show_spiner(msg_start ="Carregando",msg_end="Concluido com sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    # Bloco de Código: https://guru-sp.github.io/tutorial_ruby/blocos-ruby.html
    yield
    spinner.success("(#{msg_end})") # Stop animation
  end

end



