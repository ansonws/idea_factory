class ChangeIdeasIdToIdeaIdInMemberships < ActiveRecord::Migration[5.2]
  def change
    rename_column :memberships, :ideas_id, :idea_id 
  end
end
