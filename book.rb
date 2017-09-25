class Book
  @@on_shelf = []
  @@on_loan = []

  def initialize(title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def self.create(title, author, isbn)
    new_book = Book.new(title, author, isbn)
    @@on_shelf << new_book
    return new_book
  end

  def self.available
    @@on_shelf
  end

  def self.borrowed
    @@on_loan
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.lent_out?(book_title)
    @@on_loan.include?(book_title)
  end

  def self.current_due_date
    Time.now + (60 * 60 * 24 * 7)
  end
end

new_book = Book.create("Booping", "Cece", "2424")
puts new_book.inspect

new_book = Book.create("Another One", "DJ Khaled", "2425")
new_book = Book.create("Meows", "Professor Meow", "2426")

puts Book.available.inspect
puts Book.borrowed.inspect

puts Book.browse.inspect

puts "Check if \"Booping\" is lent out: #{Book.lent_out?("Booping")}"

puts Book.current_due_date
