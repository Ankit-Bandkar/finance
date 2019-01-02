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
		)
	end
end
