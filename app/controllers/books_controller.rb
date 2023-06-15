class BooksController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @books = Book.new
  end

  def create
    # データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
      # データをデータベースに保存するためのsaveメソッド実行
      if @book.save
         # フラッシュメッセージを定義し、詳細画面へリダイレクト
        flash[:notice] = "Book was successfully created."
        redirect_to book_path(@book.id)
      else
        # 入力項目が空白だとエラー
        @books = Book.all
        render :index
      end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
    @books = Book.new
  end

  def update
    @book = Book.find(params[:id])
      # 更新メソッド実行
      if @book.update(book_params)
         # フラッシュメッセージを定義し、詳細画面へリダイレクト
        flash[:notice] = "Book was successfully updated."
        redirect_to book_path(@book.id)
      else
        # 入力項目が空白だとエラー
        render:edit
      end
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy                   # データ（レコード）を削除
    flash[:notice] = "Book was successfully destroyed." # フラッシュメッセージを定義
    redirect_to '/books'           # 投稿一覧画面へリダイレクト
  end

end
