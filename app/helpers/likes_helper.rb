module LikesHelper
  def current_micropost
    @current_micropost ||= Micropost.find_by(id: session[:micropost_id])
  end
  
  def logged_in?
    !!current_micropost
  end
end
