class ExpensesController < ApplicationController

    def new
        @user = current_user
        @expense = Expense.new
    end

    def create
        @user = User.find(current_user.id)
        @expense = current_user.expense.new(expense_params)
        if @expense.save
            flash[:success] = "Expense created"
            redirect_to @user
        else
            flash[:danger] = "not created"
            redirect_to @user
        end
    end

    def edit
        @expense = Expense.find(params[:id])
    end

    def update
        @expense = Expense.find(params[:id])
        if @expense.update_attributes(expense_params)
          flash[:success] = "Entry updated"
          redirect_to current_user
        else
          render 'edit'
        end
    end

    def destroy
        @expense = Expense.find(params[:id])
        @expense.destroy
        flash[:success] = "Entry deleted"
        redirect_to current_user
    end

    private

    def expense_params
        params.require(:expense).permit(:amount, :category_id, :description, :entry_date)
    end

end