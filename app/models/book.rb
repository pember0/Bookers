class Book < ApplicationRecord
  #title、bodyの入力（存在）チェック
  validates :title, presence: true
  validates :body, presence: true
end
