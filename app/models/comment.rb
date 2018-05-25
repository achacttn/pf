class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :article

    validates :subject, length: {minimum: 1}
    validates :text_body, length: {minimum: 1}

end