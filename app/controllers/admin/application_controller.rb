module Admin
  class ApplicationController < ::ApplicationController
    include Pagy::Backend
    before_action :require_login
    layout 'admin' 
  end
end
