class ResumesController < ApplicationController
	include Write_to_pdf	
	http_basic_authenticate_with name: "akash", password: "akash", except: [:index, :show]
	def new
		@resume = Resume.new
	end

	def index
			@resumes = Resume.all
	end
	def show
		@resume = Resume.find(params[:id])
		
	end
	def edit
		@resume = Resume.find(params[:id])
	end
	def write
		if @resume.nil?
			writing(@resume)
		else
			print "error"
		end		
	end
	def create
		 @resume = Resume.new(resume_params)
		 if @resume.save
		 redirect_to @resume
		else
			render 'new'
		end
	end
	def update
		@resume = Resume.find(params[:id])
		if @resume.update(resume_params)
			redirect_to @resume
		else
			render'edit'
		end
	end
	
	def destroy
		@resume = Resume.find(params[:id])
		@resume.destroy
		redirect_to resumes_path
	end
	private
		def resume_params
			params.require(:resume).permit(:name, :email, :phone, :description)	
		end
end
