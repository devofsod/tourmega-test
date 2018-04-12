require "./purchase_item.rb"

class Bill
  attr_accessor :items

  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def sales_taxes
    sales_taxes = 0.0

    @items.each do |item|
      sales_taxes += item.sales_taxes
    end

    sales_taxes
  end

  def total
    total = 0.0

    @items.each do |item|
      total += item.total
    end

    total
  end

  def output
    @items.each do |item|
      item.output
    end

    puts "Sales Taxes:" + sales_taxes.round(2).to_s
    puts "Total:" + total.round(2).to_s
  end
end
