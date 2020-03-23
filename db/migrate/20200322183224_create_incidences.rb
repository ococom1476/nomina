class CreateIncidences < ActiveRecord::Migration[6.0]
  def change
    create_table :incidences do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.column :incidence_type, "ENUM('deductions','perceptions','illness','absence','delay','vacation','extrahours','extraday')"
      t.date :start_date
      t.date :end_date
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
