class AddCoverLetterToUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :cover_letters do |t|
      t.string     :url
      t.string     :orientation
      t.references :user
      t.timestamps
    end
  end
end
