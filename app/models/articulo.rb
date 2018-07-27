class Articulo < ApplicationRecord
  belongs_to :usuario
  has_many :articulo_categorias
  has_many :categorias, through: :articulo_categorias
  validates :titulo, presence: true, length: {minimum: 4, maximum: 50}
  validates :descripcion, presence: true, length: {minimum: 10, maximum: 300}
  validates :usuario_id, presence: true
end