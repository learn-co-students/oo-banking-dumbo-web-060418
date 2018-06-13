require 'pry'

class Transfer
  # your code here

  attr_accessor  :sender, :receiver, :amount, :status

  def initialize(sender,receiver,amount)
     @status = "pending"
     @sender = sender
     @receiver = receiver
     @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction

      if self.sender.valid? && @status == "pending" && @amount < self.sender.balance
        self.sender.balance = self.sender.balance - @amount
        self.receiver.balance = self.receiver.balance + @amount
        self.status = "complete"

      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if execute_transaction
      self.receiver.balance = self.receiver.balance - @amount
      self.sender.balance = self.sender.balance + @amount
      self.status = "reversed"
    end

  end

end
