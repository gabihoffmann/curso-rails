namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    # ações da task
    # %x() permite executar comandos do terminal
    puts %x(rails db:drop db:create db:migrate db:seed)
  end

end
