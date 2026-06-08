class Ability
  include CanCan::Ability

  def initialize(user)
    # Si el visitante no está logueado, es un usuario invitado (guest)
    user ||= User.new 

    # --- 1. PERMISOS PARA INVITADOS (No logueados) ---
    can :read, Event
    can :read, Venue
    can :read, Category
    can :read, Review

    # Si es un usuario nuevo sin guardar en BD (invitado), aquí termina el flujo
    return if user.new_record?

    # --- 2. PERMISOS PARA USUARIOS REGULARES ---
    if user.regular?
      can :create, Event
      # Editar/cancelar solo sus propios eventos
      can [:update, :destroy], Event, user_id: user.id 
      
      can :create, Registration
      # Cancelar solo su propia inscripción
      can :destroy, Registration, user_id: user.id 
      
      can :create, Review
      # Nota: Puedes dejar que editen sus propias reviews si lo deseas
      can [:update, :destroy], Review, user_id: user.id
    end

    # --- 3. PERMISOS PARA ADMINISTRADORES ---
    if user.admin?
      can :manage, :all # Dios en la plataforma: maneja eventos, categorías, venues, usuarios y reviews
    end
  end
end