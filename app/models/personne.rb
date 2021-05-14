class Personne < ApplicationRecord
    validates_presence_of :prenom, :nom, :profession, :telephone, :adresse
end
