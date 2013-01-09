module Spree
  module Admin
    class PostsController < ResourceController

      def index
        @posts = Post.all
        respond_with(@coupons) do |format|
          format.html
          format.json { render :json => json_data }
        end
      end

      def show
        redirect_to( :action => :edit )
      end

      def destroy
            @post = Post.find(params[:id])
            @post.delete

            respond_with(@post) do |format|
              format.html { redirect_to collection_url }
              format.js  { render_js_for_destroy }
            end
      end
    end
  end
end
