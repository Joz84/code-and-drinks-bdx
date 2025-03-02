class Round < ApplicationRecord
  belongs_to :exercice
  belongs_to :city_quarter
  has_many :games
  has_many :users, through: :games

  enum role: [ :student, :teacher ]
  enum progress: [ :pending, :active, :pasted ]

  validates :role, presence: true
  validates :rank, presence: true

  def unqualified_users
    city_quarter.users.where.not(id: users.map(&:id)).where(role: role)
  end

  def create_last_games(attrs={})
    unqualified_users.each do |user|
      begin
        url = "https://www.codewars.com/api/v1/users/#{user.cw_nickname}/code-challenges/completed"
        kata = JSON.parse(RestClient.get(url).body)["data"].find{|kata| kata["id"] == self.exercice.url}
        if kata && DateTime.parse(kata["completedAt"]).to_date == DateTime.now.to_date
          user.games.create(
            round: self,
            finished_at: DateTime.parse(kata["completedAt"]),
            rating: 10
          )
        elsif attrs[:finish]
          user.games.create(
            round: self,
            finished_at: DateTime.now,
            rating: 0
          )
        end
      rescue
      end
    end
    games.where
         .not(games: {rating: 0})
         .order(:finished_at)
         .each_with_index do |game, index|
            game.update(rating: (10 - index > 0) ? (10 - index) : 0)
          end
  end

  def can_be_revealed?
    pending? && (rank == 1 || city_quarter.rounds.where(role: role).find_by(rank: rank - 1, progress: :pasted))
  end

end
