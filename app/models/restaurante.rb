# frozen_string_literal: true

class Restaurante
  include Mongoid::Document

  field :nome, type: String
  field :apelido, type: String, default: 'Sem apelido'
  field :location, type: Geo::Ponto
end
