class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_idea

    def create
        like = Like.new(user: current_user, idea: @idea)
        
        unless can?(:like, @idea)
            flash[:danger] = "That's a bit narcissistic..."
            return redirect_to idea_path(@idea)
        end

        if like.save
            flash[:success] = "Idea liked"
        end
        
        redirect_to request.referer
    end

    def destroy
        like = Like.find params[:id]
        like.destroy
        flash[:success] = "Idea unliked"
        redirect_to request.referer
    end

    private 

    def find_idea
        @idea = Idea.find params[:idea_id]
    end
end
