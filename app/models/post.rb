class Post < ApplicationRecord
    belongs_to :user
    scope :recent, -> { order(created_at: :desc) }

    DRAFT_OFF = 0
    DRAFT_ON = 1
    PUBLIC_OFF = 0
    PUBLIC_ON = 1
end
