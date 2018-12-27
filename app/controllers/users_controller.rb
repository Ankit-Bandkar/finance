class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def show
        @org = Organization.find(current_user.organization_id)
        @user = User.find(params[:id])
    end

end
