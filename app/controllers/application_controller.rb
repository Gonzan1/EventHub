class ApplicationController < ActionController::Base
  # Captura el error de CanCanCan y redirige con un mensaje limpio
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: "No tienes autorización para realizar esta acción."
  end
end