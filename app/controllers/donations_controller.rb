class DonationsController < ApplicationController
	before_filter :load_project
	before_filter :require_login, :only => [:new, :create]

	def show
		@donation = Donation.find(params[:id])
	end

	def new
		@donation = @project.donation.build
	end

	def create
		@donation = @project.donations.build(donation_params)
		@donation.user = current_user

		respond_to do |format|
			if @donation.save
				@project.donations(true)
				format.html { redirect_to projects_path, notice: "Thank for your donation"}
				format.js {}
			else
				format.html { render "projects/show", alert: "There was an error" }
				format.js {}
			end
		end
	end

	private

	def donation_params
		params.require(:donation).permit(:amount, :project_id, :user_id)
	end

	def load_project
		@project = Project.find(params[:project_id])
	end
end
