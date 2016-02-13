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
   end
 end