class ServicesController < ApplicationController

	def index

		
		if params[:query] != nil

			case params[:query]

			when "hairstylist"
				
				@services = User.where(:role => 2)
				render :json => @services

			when "host"

				@services = User.where(role: 3)
				render json: @services

			else

				render :json => {:title => "Others"}											

			end
			
		else

			@services = User.where(role: 2)
		end
	
	end

	def show
		
		@user = User.find_by(id: params[:id])


	end


end
