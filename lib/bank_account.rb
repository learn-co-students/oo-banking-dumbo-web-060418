class BankAccount
  attr_accessor :status, :balance, :status
  attr_reader :name

  def initialize(name= "Avi", balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if @balance > 0 && @status == "open"
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end


end
