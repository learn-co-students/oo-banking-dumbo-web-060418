require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@all = []
  def initialize(sender, receiver, amount=0)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount

  end

  def valid?
    sender.valid? and receiver.valid?
  end

  def execute_transaction
    if valid? and @status != 'complete' and self.sender.balance > amount
      receiver.balance += @amount
      sender.balance -= @amount
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
      if @status == 'complete'
        receiver.balance -= @amount
        sender.balance += @amount
        @status = 'reversed'
      end
  end

end


# Build BancAccount class
# Instance of BancAccount use Transfer class to transfer money
# Transfer instance have a status (pending, complete or rejected)```
