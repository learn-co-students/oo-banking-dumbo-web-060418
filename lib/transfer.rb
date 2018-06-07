require_relative './bank_account.rb'
require "pry"

class Transfer
  
  attr_accessor :balance, :status, :amount, :sender
	attr_reader :receiver

  def initialize(sender, receiver, amount)
  	@sender = sender
  	@receiver = receiver
  	@status = 'pending'
  	@amount = amount
  end

  def valid?
  	if self.sender.valid? && self.receiver.valid?
  		true
  	else
  		false
  	end
  end

  def execute_transaction
	 if self.amount > self.sender.balance
	 	self.status = 'rejected'
	  	"Transaction rejected. Please check your account balance."
	elsif self.valid? && self.status == 'pending'
	  	self.sender.balance	= self.sender.balance - self.amount
	  	self.receiver.balance += self.amount
	  	self.status = 'complete'
  	end
  end


	def reverse_transfer
		if self.status == 'complete'
			self.sender.balance	= self.sender.balance + self.amount
	  		self.receiver.balance -= self.amount
	  		self.status = 'reversed'
	  	end
		self.sender.balance

	end
end

