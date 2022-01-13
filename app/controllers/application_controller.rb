class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
        if resource.instance_of?(Admin)
          admin_client_list_path
        elsif resource.instance_of?(User)
          users_path
        end
      end
    
      def after_sign_out_path_for(resource)
        case resource
        when :admin
          new_admin_session_path
        when :user
          root_path
        end
      end

      def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[username])
        devise_parameter_sanitizer.permit(:account_update, keys: %i[username])
      end
end
