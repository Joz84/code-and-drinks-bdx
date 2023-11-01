class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :city_quarter
  has_many :games

  enum role: [ :student, :teacher ]
  enum language: [ :ruby, :python, :sql ]

  validates :cw_nickname, presence: true
  validates :role, presence: true
  validates :language, presence: true

  validate :cw_nickname_exist

  def cw_nickname_exist
    code = 100
    begin
      code = RestClient.get("https://www.codewars.com/api/v1/users/#{cw_nickname}").code
    rescue
      code = 404
    end
    if code != 200
      errors.add(:cw_nickname, "does not exist")
    end
  end

end
