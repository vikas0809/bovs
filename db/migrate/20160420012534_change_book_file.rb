class ChangeBookFile< ActiveRecord::Migration
  def change
     reversible do |dir|
      change_table :books do |t|
        dir.up   { t.change :book, :binary, :limit => 10.megabyte }
        dir.down { t.change :book, :binary }
        rename_column :books, :book, :bookfile
        add_column :books, :Book_Filename, :string
        add_column :books, :Book_Format, :string
      end
    end
  end
end
