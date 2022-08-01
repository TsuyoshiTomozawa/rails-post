class CreatePosts < ActiveRecord::Migration[7.0]
    def change
        create_table :posts do |t|
            t.references :user, foreign_key: true
            t.string :title, null: false
            t.text :body, null: false
            t.boolean :is_draft, null: false, default: 1
            t.boolean :is_public, null: false, default: 0
            t.timestamps
        end
        add_foreign_key :posts, :users
    end
end
