class CreatePayrollInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :payroll_invoices do |t|
      t.belongs_to :employee, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.text :concept
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end
  end
end
