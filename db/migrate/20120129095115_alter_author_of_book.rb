class AlterAuthorOfBook < ActiveRecord::Migration
  def up
    remove_column :books,:author
  end

  def down
    change_table :books do |t|
      t.boolean :author ,:default=>false
    end
  end
end
