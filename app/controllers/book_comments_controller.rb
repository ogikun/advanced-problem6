class BookCommentsController < ApplicationController
    def create
        @book_comment = BookComment.find(book_id: params[:id])
        book = Book.find(params[:book_id])
    　　comment = BookComment.new(book_comment_params)
    　　comment.user_id = current_user.id
    　　comment.book_id = book.id
    　　comment.save
    end
    
    def destroy
        comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
        if current_user.id == comment.user_id
          comment.destroy
        end
    end
    
    private
    
    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end
end