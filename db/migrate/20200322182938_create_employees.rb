class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :rfc
      t.date :date
      t.string :imss_number

      t.timestamps
    end
  end
end
