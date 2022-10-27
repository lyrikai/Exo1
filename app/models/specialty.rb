class Specialty < ApplicationRecord
    has_many :cacas
    has_many :doctors, through: :cacas
end
