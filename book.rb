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

  def lent_out?
    @@on_loan.include?(self)
  end

  def self.current_due_date
    Time.now + (60 * 60 * 24 * 7)
  end

  def borrow
    if self.lent_out?
      puts "I'm sorry, the book is current lent out"
    else
      puts "Sure, you can borrow this book titled #{@title}"
      # set due date for book
      @due_date = Book.current_due_date
      # remove from on_shelf and add to on_loan
      @@on_shelf.delete(self)
      @@on_loan.push(self)
    end
  end

  def title
    @title
  end

  def due_date
    @due_date
  end

  def due_date=(date)
    @due_date = date
  end

  def return_to_library
    if self.lent_out?
      @due_date = nil
      @@on_loan.delete(self)
      @@on_shelf.push(self)
      puts "Thank you for returning the book #{@title}!"
    else
      puts "The book is not lent out, no return required."
    end
  end

  def self.overdue
    @@on_loan.select do |book|
      book.due_date < Time.now
    end
  end
end

new_book = Book.create("Booping", "Cece", "2424")
puts new_book.inspect

new_book2 = Book.create("Another One", "DJ Khaled", "2425")
new_book3 = Book.create("Meows", "Professor Meow", "2426")
overdue_book = Book.create("Best Book Ever", "Dinobot", "2464")
overdue_book.borrow
overdue_book.due_date = Time.now - 60

puts Book.available.inspect
puts Book.borrowed.inspect

puts Book.browse.inspect

puts "Check if #{new_book.title} is lent out: #{new_book.lent_out?}"

puts Book.current_due_date

new_book.borrow
puts Book.available.inspect
puts Book.borrowed.inspect
puts "#{new_book.title} is lent out: #{new_book.lent_out?} and is due #{new_book.due_date}"

new_book3.return_to_library
new_book.return_to_library
puts "#{new_book.title} is lent out: #{new_book.lent_out?} and is due #{new_book.due_date}"

puts "List of overdue books: #{Book.overdue}"
