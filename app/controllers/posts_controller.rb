# We are using authenticate_user!(provided by devise)
# to protect all actions except index and show.

class PostsController < ApplicationController
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, except: [:index, :show]

	
	def index
		@posts = Post.page(params[:page]).per_page(3)
		@posts_results = Post.text_search(params[:query]).page(params[:page]).per_page(3)
	end

	def new
		@post = Post.new
	end

	def create
    @post = Post.new (post_params)
    if @post.save
      flash[:notice] = 'New post was created'
      redirect_to posts_path
    else
      flash[:error] = 'Post could not be created'
      render 'new'
    end
	end

	def show
		respond_to do |format|
			format.html
			format.pdf do
				pdf = PostPdf.new(@post)
				send_data pdf.render, filename: "#{@post.title}.pdf",
															type: "application/pdf",
															disposition: "inline"

			end
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "Post updated"
			redirect_to post_path(@post)
		else
			flash[:error] = "Could not save post"
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		flash[:notice] = "Post Deleted"
		redirect_to posts_path
	end

	private

	def post_params
    params.require(:post).permit(:title, :body, :links, :biography, :writings, :further_readings, :source, :primary_image, :category_id, :new_category_name)
	end

	def set_post
	  @post = Post.find(params[:id])		
	end

end