class Feed < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    acts_as_votable
    has_one_attached :image

    def self.search(search)
        where("UPPER(text) LIKE ?", "UPPER(%##{search}%)")
    end
end
