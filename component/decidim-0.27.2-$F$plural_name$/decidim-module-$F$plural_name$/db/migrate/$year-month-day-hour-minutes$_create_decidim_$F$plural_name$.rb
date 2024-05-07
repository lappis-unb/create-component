# frozen_string_literal: true

class CreateDecidim$Plural_name$ < ActiveRecord::Migration[5.1]
  def change
    # Create the initial table structure
    create_table :decidim_$plural_name$_$plural_name$ do |t|
      t.jsonb :body
      t.references :decidim_component, index: { name: 'index_decidim_$plural_name$_$plural_name$_on_decidim_component_id' }
      t.timestamps
    end

    # Ensure that these columns are removed
    remove_column :decidim_$plural_name$_$plural_name$, :title, if_exists: true
    remove_column :decidim_$plural_name$_$plural_name$, :commentable, if_exists: true
  end
end
