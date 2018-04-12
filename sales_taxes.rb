require "csv"
require "./purchase_item.rb"
require "./bill.rb"

class SalesTaxes
  BOOK_KEYWORDS = ["book"]
  FOOD_KEYWORDS = ["chocolate"]
  MEDICAL_KEYWORDS = ["pill", "headache"]

  def self.run
    input_file = ARGV[0]
    bill = self.parse_input(input_file)
    bill.output
  end

  def self.parse_input(file_name)
    bill = Bill.new
    index = 0

    CSV.foreach(file_name) do |row|
      if index == 0
        index += 1
        next
      end

      params = { name: row[1], quantity: row[0].to_i, price: row[2].to_f.round(2) }
      params[:is_imported] = params[:name].include?("imported")
      params[:is_exempt] = false

      (BOOK_KEYWORDS + FOOD_KEYWORDS + MEDICAL_KEYWORDS).each do |keyword|
        params[:is_exempt] = params[:is_exempt] || params[:name].include?(keyword)
      end

      item = PurchaseItem.new(params)
      bill.add_item(item)
      index += 1
    end

    bill
  end
end

SalesTaxes.run
