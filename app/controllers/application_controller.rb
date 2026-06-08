class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    # Simulacion de estar conectados.
    @current_user ||= User.find_by(email: 'gsalinas@miuandes.cl') || User.first
  end
end