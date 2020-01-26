class Feed < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    acts_as_commontable dependent: :destroy
    acts_as_votable
    has_one_attached :image

    def self.search(search)
        where("text LIKE ?", "%##{search}%")
    end
end
