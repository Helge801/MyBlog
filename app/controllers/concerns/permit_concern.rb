module PermitConcern

  def should_permit? item
    if signed_in?
      if item.is_a?(Blog)
        current_user.id == item.user_id || current_user.has_roles?(:admin)
      elsif item.is_a?(Post) || item.is_a?(Comment)
        current_user.id == item.blog.user_id || current_user.has_roles?(:admin)
      end
    else
      false
    end
  end


  
end