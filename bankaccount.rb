class BankAccount
  @@interest_rate = 0.05
  @@accounts = []

  def self.get_all_accounts
    @@accounts
  end

  def self.create
    new_account = BankAccount.new
    @@accounts << new_account
    return new_account
  end

  def self.total_funds
    sum_of_funds = 0
    @@accounts.each do |account|
      sum_of_funds += account.balance
    end

    return sum_of_funds
  end

  def self.interest_time
    @@accounts.each do |account|
      account.balance *= (1 + @@interest_rate)
    end
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

my_account = BankAccount.create
janes_account = BankAccount.create

my_account.deposit(500)
janes_account.deposit(600)

puts BankAccount.get_all_accounts.inspect
puts BankAccount.total_funds.inspect

BankAccount.interest_time
puts BankAccount.get_all_accounts.inspect
puts BankAccount.total_funds.inspect

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
