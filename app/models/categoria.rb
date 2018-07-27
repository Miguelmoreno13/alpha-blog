class Categoria < ApplicationRecord
  has_many :articulo_categorias
  has_many :articulos, through: :articulo_categorias
  validates :nombre, presence: true, length: { minimum: 5, maximum: 20}
  validates_uniqueness_of :nombre
end