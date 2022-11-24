require 'book_repository'

def reset_students_table
  seed_sql = File.read('spec/seeds_books.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
  connection.exec(seed_sql)
end

describe BookRepository do
  before(:each) do 
    reset_students_table
  end

  it 'prints out the list of books to the terminal' do
    repo = BookRepository.new

    books = repo.all

    expect(books.length).to eq(3)
    expect(books.first.title).to eq('Nineteen Eighty-Four')

    expect(books[1].id).to eq('2')
    expect(books[1].title).to eq('Emma')
    expect(books[1].author_name).to eq('Jane Austen')

    expect(books[2].id).to eq('3')
    expect(books[2].title).to eq('Dracula')
    expect(books[2].author_name).to eq('Bram Stoker')
  end
end