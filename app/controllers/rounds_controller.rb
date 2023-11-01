class RoundsController < ApplicationController
  def update
    @round = Round.find(params[:id])
    if @round.active?
      @round.create_last_games(finish: true)
      @round.pasted!
    elsif @round.pending?
      @round.active!
    end
    redirect_to root_path
  end
end
