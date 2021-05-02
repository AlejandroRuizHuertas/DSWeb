class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    helper_method :usuarios

    def current_user
        User.find_by(id: session[:idUsuario])
    end

    def logged_in?
       
        !current_user.nil?
    end

    def usuarios
        User.all()
    end    
end
