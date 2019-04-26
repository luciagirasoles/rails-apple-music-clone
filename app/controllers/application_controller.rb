class ApplicationController < ActionController::Base
  
    include Pundit
  
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    protected

    def after_sign_in_path_for(user)
      if user.admin?
        admin_root_path
      else
        regulars_path
      end
    end

    private
   
      def user_not_authorized
        flash[:notice] = "You are not authorized to perform this action."
        redirect_to(request.referrer || root_path)
      end
end
