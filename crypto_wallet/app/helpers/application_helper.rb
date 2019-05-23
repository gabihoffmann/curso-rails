module ApplicationHelper
    # https://apidock.com/ruby/DateTime/strftime
    def dataBrasil(today)
        today.strftime("%d/%m/%Y")
    end

    def nome_aplicacao
        "Crypto Wallet Application"
    end
end
