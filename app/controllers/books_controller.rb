class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

 def show
   @book = Book.find(params[:id])
   @user = @book.user
   @books = Book.new
   @book_comment = BookComment.new
 end

 def index
   @books = Book.all
   @books = Book.find(params[:id])
 end

  def create
		@book = Book.new(book_params) 
		@book.user_id = current_user.id
  	if @book.save 
  		redirect_to @book, notice: "successfully created book!"#保存された場合の移動先を指定。
  	else
			@books = Book.all
  		render action: :index
  	end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: "successfully updated book!"
    else
      render "edit"
    end
  end

  def delete
    @book = Book.find(params[:id])
    @book.destoy
    redirect_to books_path, notice: "successfully delete book!"
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    if current_user != @user
      redirect_to books_path
    end
  end
end