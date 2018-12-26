class IncomesController < ApplicationController

    def new
        @income = Income.new
    end

    def create
        @user = User.find(current_user.id)
        @income = current_user.income.new(income_params)
        if @income.save
            flash[:success] = "Income created"
            redirect_to @user
        else
            flash[:danger] = "not created"
            redirect_to @user
        end
    end

    def edit
        @income = Income.find(params[:id])
    end

    def update
        @income = Income.find(params[:id])
        if @income.update_attributes(income_params)
          flash[:success] = "Entry updated"
          redirect_to current_user
        else
          render 'edit'
        end
    end

    def destroy
        @income = Income.find(params[:id])
        @income.destroy
        flash[:success] = "Entry deleted"
        redirect_to current_user
    end

    private

    def income_params
        params.require(:income).permit(:amount, :category_id, :description, :entry_date)
    end
end