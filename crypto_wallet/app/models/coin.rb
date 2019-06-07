class Coin < ApplicationRecord
    # essa linha informa ao model que o Coin conversa com MiningType e
    # a informação do campo pertence a chave estrangeira de outra tabela
    belongs_to :mining_type  #, optional: true permite que campo fique em branco
end
