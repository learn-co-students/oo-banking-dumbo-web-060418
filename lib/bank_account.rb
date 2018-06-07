class BankAccount

	attr_reader :name
	attr_accessor :balance, :status

	def initialize(name)
		@name = name
		@balance = 1000
		@status = 'open'
	end

  def close_account
		@status = "closed"
	end

	def deposit(num)
		@balance += num
	end

	def display_balance
		"Your balance is $#{@balance}."
	end

	def valid?
		@status == "open" and @balance > 0 ? true : false
	end

end
