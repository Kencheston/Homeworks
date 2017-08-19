class BooksController < ApplicationController
  def index
    @books = Book.all
    render :index
  end

  def new
    render :new
  end

  def create
      book = Book.new(book_params)
   if book.save
     redirect_to books_url
   else
     flash.now[:errors] = book.errors.full_messages
     render :new
   end
  end

  def destroy
    #postman is not working
    #these are default APIss???
    book = Book.find(params[:id])
    book.destroy
    #how am I suppose to know this?????
    redirect_to books_url
    #what is this command???
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
