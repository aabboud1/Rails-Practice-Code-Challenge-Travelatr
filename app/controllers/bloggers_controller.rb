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
    end

    def create
        @blogger = Blogger.new(blogger_params)
        if @blogger.save 
            redirect_to blogger_path(@blogger.id)
        else 
            render :new
        end
    end
end

private

def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end