class BooksController < ApplicationController


	def top
	end

	def about
	end

	def new
		@book = Book.new

	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if   @book.save
			 flash[:notice] = "Book was successfully created."
			 redirect_to book_path(@book.id)
		else flash[:notice] = "ERROR!!"
  	      	 redirect_to user_path(current_user.id)
		end
	end

	def index
		@books = Book.all
		@book = Book.new
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@book_new=Book.new
	end

	def edit
		@book = Book.find(params[:id])
		if @book.user_id.to_i != current_user.id
        	flash[:notice] = "ERROR!!編集する権限がありません。"
        	redirect_to user_path(current_user.id)
   		end
	end

	def update
  		book = Book.find(params[:id])
  		book.update(book_params)
  		flash[:notice] = "Book was successfully updated."
  		redirect_to book_path(book.id)
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		flash[:notice] = "Book was successfully destroyed."
		redirect_to books_path
	end

	private
	def book_params
		params.require(:book).permit(:title, :opinion)
	end

end
