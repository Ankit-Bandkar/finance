class UsersController < ApplicationController
    def index
        @user = User.where(organization_id: current_user.organization_id)
    end

    def show
        @org = Organization.find(current_user.organization_id)
        @user = User.find(params[:id])
        @incomes = @user.income
        @expenses = @user.expense
        respond_to do |format|
            format.html
            format.pdf do
                pdf = EntryPdf.new(@user)
                send_data pdf.render, type: "application/pdf", disposition: "inline"
            end
        end
    end

end
