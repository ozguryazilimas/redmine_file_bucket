class CreateModelBase < ActiveRecord::Migration

  def change
    create_table :rfb_project_settings do |t|
      t.integer :project_id
      t.boolean :issue_enabled, :default => true, :null => false
      t.boolean :wiki_page_enabled, :default => true, :null => false
      t.boolean :document_enabled, :default => true, :null => false
      t.boolean :project_enabled, :default => true, :null => false
      t.boolean :version_enabled, :default => false, :null => false
      t.boolean :news_enabled, :default => false, :null => false
      t.boolean :subproject_enabled, :default => false, :null => false

      t.timestamps :null => false
    end
  end

end

