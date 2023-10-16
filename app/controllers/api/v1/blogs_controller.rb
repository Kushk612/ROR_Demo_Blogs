class Api::V1::BlogsController < ApplicationController
    protect_from_forgery with: :null_session
    def index
        blogs = Blog.all
        render json: blogs, status: 200
    end

    def edit
        blog = Blog.find_by(id: params[:id])
        render json: blog, status: 200
    end

    def destroy
        blog = Blog.find_by(id: params[:id])
        redirect_to root_path
    end

    def create
        blog = Blog.new(blog_params)
        if blog.save!
            render json: blog, status: 200  
        else
            render json: { error: 'blog not created' } 
        end       
    end

    def show
        blog = Blog.find_by(id: params[:id])
        if blog
            render json: blog, status: 200  
        else
            render json: { error: 'blog not Found' } 
        end     
    end

    private

    def blog_params
        params.require(:blog).permit(:title, :decsription, :image)
    end
end
