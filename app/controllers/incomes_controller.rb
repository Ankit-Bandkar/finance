class IncomesController < ApplicationController

    def new
        @income = Income.new
    end

    def create
        @user = User.find(current_user.id)
        @income = current_user.income.new(income_params)
        @income.organization_id = current_user.organization_id
        if @income.save
            flash.now[:success] = "Entry created"
        else
            flash.now[:danger] = "not created"
        end
    end

    def edit
        @income = Income.find(params[:id])
    end

    def update
        @income = Income.find(params[:id])
        if @income.update_attributes(income_params)
          flash[:success] = "Entry updated"
        else
          render 'edit'
        end
    end

    def destroy
       if @income = Income.destroy(params[:id])
        flash.now[:success] = "Entry deleted"
       end     
    end

    private

    def income_params
        params.require(:income).permit(:amount, :category_id, :description, :entry_date)
    end
end