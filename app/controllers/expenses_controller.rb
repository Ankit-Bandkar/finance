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
        else
            flash[:danger] = "not created"
        end
    end

    def edit
        @expense = Expense.find(params[:id])
    end

    def update
        @expense = Expense.find(params[:id])
        if @expense.update_attributes(expense_params)
          flash[:success] = "Entry updated"
        else
          render 'edit'
        end
    end

    def destroy
        if @expense = Expense.destroy(params[:id])
            flash.now[:success] = "Entry deleted"
        end   
    end

    private

    def expense_params
        params.require(:expense).permit(:amount, :category_id, :description, :entry_date)
    end

end