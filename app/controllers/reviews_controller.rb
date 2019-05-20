class ReviewsController < ApplicationController
    before_action :authenticate_user! 

    def create
        @idea = Idea.find(params[:idea_id])
        @review = Review.new review_params
        @review.idea = @idea
        @review.user = current_user
        if @review.save
            flash[:primary] = "Review saved"
            redirect_to idea_path(@idea)
        else
            flash[:danger] = @review.errors.full_messages.join(', ')
            @reviews = @idea.reviews.order(created_at: :desc)
            render 'ideas/show'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        if can? :crud, @review
            @review.destroy
            redirect_to idea_path(@review.idea)
        else
            head :unauthorized
        end
    end

    private

    def review_params
        params.require(:review).permit(:body)
    end
end
