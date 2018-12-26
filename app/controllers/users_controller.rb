class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def show
        @org = Organization.find(params[:id])
        @user = User.find(params[:id])
    end

end
