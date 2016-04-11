json.array!(@books) do |book|
  json.extract! book, :id, :name, :authorId, :category, :description, :price, :publishedDate, :status, :condition, :cover, :book
  json.url book_url(book, format: :json)
end
