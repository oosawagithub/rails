class PostsController < ApplicationController

  def new

  	#空のモデルをビューへ渡す
  	@post = Post.new

  end

  #以下を追加
  def create

  	#ストロングパラメーターを使用
  	post = Post.new(post_params)

  	#DBへ保存する
  	post.save

    #詳細画面へリダイレクト
  	redirect_to post_path(post.id)

  end

  def index

    @posts = Post.all

  end

  def show

    @post = Post.find(params[:id])

  end

  def edit

    @post = Post.find(params[:id])

  end

  def update

    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)

  end

#privateは一種の境界線で、「ここから下はcontrollerの中でしか呼び出せません」という意味があります。
#privateはControllerファイルの一番下のendのすぐ上に書いて下さい。

  private

  def post_params

  	 params.require(:post).permit(:title, :body, :image)

  end

end
