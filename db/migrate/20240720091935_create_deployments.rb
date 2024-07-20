class CreateDeployments < ActiveRecord::Migration[6.1]
  def change
    create_table :deployments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :application, null: false, foreign_key: true
      t.references :environment, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
