class MembershipsController < ApplicationController
    before_action :authenticate_user!
    before_action :find_idea

    def create
        membership = Membership.new(user: current_user, idea: @idea)

        if membership.save
            flash[:success] = "Joined #{@idea.title}"
        end
        
        redirect_to request.referer
    end

    def destroy
        membership = Membership.find params[:id]
        membership.destroy
        flash[:danger] = "Left #{@idea.title}"
        redirect_to request.referer
    end

    private 

    def find_idea
        @idea = Idea.find params[:idea_id]
    end
end
