class Post < ApplicationRecord
	#refileを使うときはモデルにattachmentメソッドを追加する
	attachment :image
end
