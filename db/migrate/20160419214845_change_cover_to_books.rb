class ChangeCoverToBooks < ActiveRecord::Migration
  def change
    reversible do |dir|
      change_table :books do |t|
        dir.up   { t.change :cover, :binary, :limit => 10.megabyte }
        dir.down { t.change :cover, :binary }
      end
    end
  end
end
