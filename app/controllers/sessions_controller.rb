class SessionsController < Devise::SessionsController
    respond_to :json
    skip_before_action :verify_authenticity_token
    def create
      self.resource = warden.authenticate!(auth_options)
      sign_in(resource_name, resource)
      render json: { message: 'Successfully logged in!', user: resource, authenticated: true, user: current_user }
    end
  end