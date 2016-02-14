 class PostsController < ApplicationController
   def index
     @posts = Post.all
   end

   def show
 # #19
     @post = Post.find(params[:id])
   end

   def new
   end

   def edit
     @post = Post.find(params[:id])
   end
   
   def update
     @post = Post.find(params[:id])
     @post.title = params[:post][:title]
     @post.body = params[:post][:body]
 
     if @post.save
       flash[:notice] = "Post was updated."
       redirect_to @post
     else
       flash.now[:alert] = "There was an error saving the post. Please try again."
       render :edit
     end
   end
   def destroy
     @post = Post.find(params[:id])
 
 # #8
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end
 end