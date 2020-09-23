class BloggersController < ApplicationController

    def index
        @bloggers = Blogger.all 
    end

    def show
        @blogger = Blogger.find(params[:id])
        @blogger.featured_post
        @blogger.total_likes
    end

    def new
        @blogger = Blogger.new 
        render :new
    end

    def create
        @blogger = Blogger.new(params["blogger"]["name"], params["blogger"]["age"], params["blogger"]["bio"])
        if @blogger.save 
            redirect_to taco_path(@blogger.id)
        else 
            render :new
        end
    end
end
