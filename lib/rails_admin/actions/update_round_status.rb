require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions
      class UpdateRoundStatus < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
          true
        end

        register_instance_option :only do
          ['Round']
        end

        register_instance_option :link_icon do
          'fas fa-wrench'
        end

        register_instance_option :visible? do
          bindings[:object].can_be_revealed? || bindings[:object].active?
        end

        register_instance_option :controller do
          Proc.new do
            @round = Round.find(params[:id])

            if @round.active?
              @round.create_last_games(finish: true)
              @round.pasted!
              flash[:notice] = "Results are on the way !"
            elsif @round.pending?
              @round.active!
              flash[:notice] = "Round is active !"
            end

            redirect_to rails_admin.edit_path(model_name: "Round", id: @round.id)
          end
        end
      end
    end
  end
end
