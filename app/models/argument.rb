class Argument < ApplicationRecord
    has_many :comments
    belongs_to :user
    belongs_to :article
end
