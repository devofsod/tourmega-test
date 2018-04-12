require "./float.rb"

class PurchaseItem
  ROUND_UP_TO_NEAREST = 0.05
  attr_accessor :name, :quantity, :price, :is_exempt, :is_imported

  def initialize(args)
    @name = args.fetch(:name)
    @quantity = args.fetch(:quantity)
    @price = args.fetch(:price)
    @is_exempt = args.fetch(:is_exempt, false)
    @is_imported = args.fetch(:is_imported, false)
  end

  def basic_sales_tax
    @is_exempt ? 0.0 : (@price * 0.1).round_up_to(ROUND_UP_TO_NEAREST)
  end

  def import_tax
    @is_imported ? (@price * 0.05).round_up_to(ROUND_UP_TO_NEAREST) : 0.0
  end

  def sales_taxes
    (basic_sales_tax + import_tax).round(2)
  end

  def total
    (@price + sales_taxes).round(2)
  end

  def output
    puts [@quantity, @name, total.round(2)].join(",")
  end
end


