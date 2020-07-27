class AdminController < ApplicationController
	before_action :authenticate_admin

	def index
	end

	def new_unit
	end

	# TODO
	def authenticate_admin
		# unless logged_in?
    #   flash[:error] = "You must be logged in to access this section"
    #   redirect_to new_login_url # halts request cycle
    # end
	end

end
