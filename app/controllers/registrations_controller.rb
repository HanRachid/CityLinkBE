class RegistrationsController < Devise::RegistrationsController
    respond_to :json
    skip_before_action :verify_authenticity_token
    def create
      build_resource(sign_up_params)
      resource.save
      render_resource(resource)
    end
  
    private
  
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    def render_resource(resource)
      if resource.errors.empty?
        render json: { message: 'Successfully registered!', user: resource }
      else
        render json: { message: 'error' }
      end
    end
  end