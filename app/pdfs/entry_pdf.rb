class EntryPdf < Prawn::Document
    def initialize(user)
        super(top_margin: 70)
        @user = user
        user_name
        entry_income_name
        entry_income
        entry_expense_name 
        entry_expense 
    end
    
    def user_name
        text "Entry for #{@user.name}", size: 30, style: :bold
    end

    def entry_income_name 
        move_down 20
        text "Income", size: 22, style: :bold
    end

    def entry_income
        move_down 10
        table [["Amount", "Type", "Category", "Description", "Date"]] +
        @user.income.map { |entry|
        [entry.amount, entry.type, entry.category.name, entry.description, entry.entry_date]
        }         
    end

    def entry_expense_name 
        move_down 20
        text "Expense", size: 22, style: :bold
    end

    def entry_expense
        move_down 10
        table [["Amount", "Type", "Category", "Description", "Date"]] +
        @user.expense.map { |entry|
        [entry.amount, entry.type, entry.category.name, entry.description, entry.entry_date]
        }         
    end
end