class Feed < ApplicationRecord
    belongs_to :user
    acts_as_commontable dependent: :destroy
    acts_as_votable
    has_one_attached :image
end
