module ApplicationHelper
  def avatar_url(user)
    if user.avatar.attached?
      url_for(user.avatar)
    else
      ActionController::Base.helpers.asset_path("default-avatar.png")
    end
  end
  
  def image_url(room)
    if room.image.attached?
      url_for(room.image)
    else
      ActionController::Base.helpers.asset_path("default-image.png")
    end
  end
end
