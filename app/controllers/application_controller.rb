class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
include AuthenticatedTestHelper
include AuthenticatedSystem

end
