require Rails.root.join('lib/rails_admin/actions/update_round_status.rb')

RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  config.authorize_with do
    unless current_user.admin?
      flash[:alert] = 'Sorry, no admin access for you.'
      redirect_to main_app.root_path
    end
  end


  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
    update_round_status

    # member :update_round_status do
    #   only ["Round"]
    #   link_icon "fas fa-wrench"

    #   controller do
    #     Proc.new do
    #       @round = Round.find(params[:id])

    #       if @round.active?
    #         @round.create_last_games(finish: true)
    #         @round.pasted!
    #       elsif @round.pending?
    #         @round.active!
    #       end

    #       redirect_to rails_admin.edit_path(model_name: "Round", id: @round.id)
    #     end
    #   end

    #   visible do
    #     bindings[:object].can_be_revealed? || bindings[:object].active?
    #   end

    #   register_instance_option :show_in_navigation do
    #       false
    #     end
    # end
  end
end
