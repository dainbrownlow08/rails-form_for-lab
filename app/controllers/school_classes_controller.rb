class SchoolClassesController < ApplicationController
    def show
		@class = SchoolClass.find(params[:id])
    end

    def new
		@class = SchoolClass.new
	end
    
    def create
        @class = SchoolClass.new(params.require(:school_class).permit(:title, :room_number))
        @class.title = params[:school_class][:title]
        @class.room_number = params[:school_class][:room_number]
        @class.save
        redirect_to school_class_path(@class)
    end

    def edit
        @class = SchoolClass.find(params[:id])
    end

    def update
        @class = SchoolClass.find(params[:id])
        @class.update(params.require(:school_class).permit(:title, :room_number))
        redirect_to school_class_path(@class)
    end

end