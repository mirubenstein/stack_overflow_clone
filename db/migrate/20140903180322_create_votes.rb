class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :answer
      t.belongs_to :user
    end
  end
end
