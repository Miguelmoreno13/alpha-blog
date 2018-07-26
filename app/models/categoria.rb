class Categoria < ApplicationRecord
  validates :nombre, presence: true, length: { minimum: 5, maximum: 20}
  validates_uniqueness_of :nombre
  
end