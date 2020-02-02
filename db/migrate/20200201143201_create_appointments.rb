class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.text :description
      t.timestamp :start_at, null: false
      t.timestamp :end_at
      t.string :address, default: '', null: false
      t.string :latitude, default: '', null: false
      t.string :longitude, default: '', null: false
      t.references :user, foreign_key: true
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
