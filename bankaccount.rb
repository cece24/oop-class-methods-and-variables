class BankAccount
  @@interest_rate = 0.0
  @@accounts = []

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end

  def initialize
    @balance = 0

  end

  def balance
    @balance
  end

  def balance=(new_balance)
    @balance = new_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    @balance -= amount
  end

end

puts BankAccount.create.inspect

# my_account = BankAccount.new
#
# puts "Your account balance is #{my_account.balance}"
#
# my_account.balance = 100
#
# puts "Your account balance is now #{my_account.balance}"
#
# my_account.deposit(500)
# puts "Your account balance is now #{my_account.balance}"
#
# my_account.withdraw(250)
# puts "Your account balance is now #{my_account.balance}"
