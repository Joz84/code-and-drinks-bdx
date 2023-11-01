class CityQuartersController < ApplicationController
  def show
    if current_user.admin
      student_active_round = current_city_quarter.rounds.find_by(progress: :active, role: :student )
      student_active_round&.create_last_games
      teacher_active_round = current_city_quarter.rounds.find_by(progress: :active, role: :teacher )
      teacher_active_round&.create_last_games
    end
  end
end
