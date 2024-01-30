class BooksController < ApplicationController
  def index
    @books = Book.order(:title)
  end

  def show
    @book = Book.find(params['id'])
  end

  def new
    @book = Book.new()
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to books_path, notice: "!!New book is successfully uploaded!!"
    else
      render('new')
    end
  end

  def edit
    @book = Book.find(params['id'])
  end

  def update
    @book = Book.find(params['id'])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "!!The book is successfully editted!!"
    else
      render('edit')
    end
  end

  def delete
    @book = Book.find(params['id'])
  end

  def destroy
    @book = Book.find(params['id'])
    @book.destroy
    redirect_to books_path, notice: "!!The book is successfully deleted!!"
  end

  private
  def book_params
    params.require(:book).permit(
      :title, 
      :author, 
      :price, 
      :published_date)
  end

end
