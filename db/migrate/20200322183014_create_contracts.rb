class CreateContracts < ActiveRecord::Migration[6.0]
  def change
    create_table :contracts do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.decimal :gross_salary, precision: 10, scale: 2
      t.column :payroll_type, "ENUM('weenkly','biweekly','monthly')"
      t.boolean :active

      t.timestamps
    end
  end
end
