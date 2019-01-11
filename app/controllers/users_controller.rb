class UsersController < ApplicationController
    def index
        @user = User.where(organization_id: current_user.organization_id)
    end

    def show
        @org = Organization.find(current_user.organization_id)
        @user = User.find(params[:id])
        @incomes = @user.income.order(entry_date: :desc).includes(:category)
        @expenses = @user.expense.order(entry_date: :desc).includes(:category)
        @entry = @user.entry.order(entry_date: :desc).includes(:category)
        respond_to do |format|
            format.html
            format.csv { send_data @entry.to_csv }
            format.xml { render :xml => @user.entry }
            format.xls { send_data @entry.to_xls(:columns => [:amount, {:category => [:name]}, :description, :entry_date], :headers => ["Amount", "Category", "Description", "Date"]), type: "application/xls", disposition: "inline" }
            format.pdf do
                pdf = EntryPdf.new(@user, @entry)
                send_data pdf.render, type: "application/pdf", disposition: "inline"
            end
        end
    end

    def test
        TestingJob.perform_async("10-01-2019", "12-01-2019")
        render plain: "REQUEST ADDED TO THE QUEUE"
    end
    
end
