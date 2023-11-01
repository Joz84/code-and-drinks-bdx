class Game < ApplicationRecord
  belongs_to :user
  belongs_to :round

  validates :user, presence: true
  validates :round, presence: true
  validates :finished_at, presence: true
  validates :user_id, uniqueness: {scope: :round_id}
end
