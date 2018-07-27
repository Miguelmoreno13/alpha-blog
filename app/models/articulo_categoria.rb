class ArticuloCategoria < ApplicationRecord
  belongs_to :articulo
  belongs_to :categoria
end