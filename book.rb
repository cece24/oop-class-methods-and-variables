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
end

new_book = Book.create("Booping", "Cece", "2424")
puts new_book.inspect

puts Book.available.inspect
puts Book.borrowed.inspect
