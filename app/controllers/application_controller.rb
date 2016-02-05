class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  
  # Rails 4 solution for "Can't verify CSRF token authenticity" json requests
  # See https://goo.gl/vTS5hb
  protect_from_forgery with: :null_session,
    if: Proc.new { |c| c.request.format.json? }
end
