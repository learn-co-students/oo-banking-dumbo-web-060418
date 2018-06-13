require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender="Amanda", receiver="Avi",  amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
# binding.pry
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
