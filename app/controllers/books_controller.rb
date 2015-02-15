class BooksController < ApplicationController
  # before_action :set_book, only: [:show, :edit, :update, :destory]
  
  def show
    @book = Book.find(params[:id])
    # render :show
    respond_to do |format|
      format.html { render layout: "awesome_book" }
      format.csv
      format.xml { render xml: @book }
      format.json
    end
  end
  
  def show_hide
    redirect_to books_path, status: 302
  end

  def slim
  end

  private
  # def set_book
  #   @book = Book.find(params[:id])
  # end
end
