require_relative './bank_account.rb'
require 'pry'

class Transfer

	attr_accessor :sender, :receiver, :amount, :status

	def initialize(sender, receiver, amt)
		@sender = sender
		@receiver = receiver
		@amount = amt
		@status = 'pending'
	end

	def valid?
		sender.valid? && receiver.valid? ? true : false
	end

	def execute_transaction
		if self.sender.valid? == false || self.amount > self.sender.balance
			self.status = "rejected"
			"Transaction rejected. Please check your account balance."
		else self.sender.valid? == true
			if self.status == 'pending'
				self.sender.balance -= self.amount
				self.receiver.balance += self.amount
				self.status = 'complete'	
			end
		end
	end

	def reverse_transfer
		if self.status == 'complete'
			self.sender.balance += self.amount
			self.receiver.balance -= self.amount
			self.status = 'reversed'
		end
	end

end
			