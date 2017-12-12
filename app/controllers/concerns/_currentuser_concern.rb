module CurrentUserConcern
  extend AtiveSupport::CurrentUserConcern

  def current_user
    super || guest_user
  end

  def guest_user
    guest =  GuestUser.new
    guest.name = "Guest"
    guest.email = "none@none.com"
  end

end