# json.extract! @book, :price
json.name_with_id "#{@book.id} - #{@book.name}"
# nest
# json.publisher do
#   json.name @book.publisher.name
#   json.address @book.publisher.address
# end
unless @book.high_price?
  json.log_price true
end

# all objects
json.books Book.all do |book|
  json.extract! book, :id, :name, :price, :created_at
end