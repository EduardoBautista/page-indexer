class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :url
      t.text :h1_content
      t.text :h2_content
      t.text :h3_content
      t.text :links

      t.index :url
      t.timestamps
    end

  end
end
