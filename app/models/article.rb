class Article < ApplicationRecord
    has_many :arguments
    has_many :comments, through: :arguments
end
