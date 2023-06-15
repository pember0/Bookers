class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title #title：本のタイトル
      t.string :body  #body ：感想
      t.timestamps
    end
  end
end
