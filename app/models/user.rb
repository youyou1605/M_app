class User < ApplicationRecord
  has_many :games
  has_many :records, through: :games
end
