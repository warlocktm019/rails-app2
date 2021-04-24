# coding: utf-8
class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.references :company, foreign_key: true
      t.string :api_key, null: false, limit: 255
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
