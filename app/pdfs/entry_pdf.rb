class EntryPdf < Prawn::Document
	def initialize(user, entry)
		super(top_margin: 70)
		@user = user
		@entry = entry
		user_name
		entry_income_name
		entry_income
	end
	
	def user_name
		text "Records for #{@user.name}", size: 30, style: :bold
	end

	def entry_income_name 
		move_down 20
		text "Entries", size: 22, style: :bold
	end

	def entry_income
		move_down 10
		table([%w[Date Type Category Description Amount]] +
		@entry.map do |entry|
		[entry.entry_date, entry.type, entry.category.name, entry.description, entry.amount]
		end, column_widths: [110, 110, 110, 110, 100]
		) do
     values = cells.columns(1..-1).rows(1..-1)
     expense_entries = values.filter do |cell|
       cell.content.to_s == 'Expense'
     end
     expense_entries.background_color = 'FFAAAA'
     income_entries = values.filter do |cell|
       cell.content.to_s == 'Income'
     end
     income_entries.background_color = 'AAFFAA'
   end
	end
end
