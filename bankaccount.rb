class BankAccount
  @@interest_rate = 0.0
  @@accounts = []

  def initialize
    @balance = 0

  end

  def balance
    @balance
  end

  def balance=(new_balance)
    @balance = new_balance
  end
end

my_account = BankAccount.new

puts "Your account balance is #{my_account.balance}"

my_account.balance = 100

puts "Your account balance is now #{my_account.balance}"
