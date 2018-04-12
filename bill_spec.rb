require "./purchase_item.rb"
require "./bill.rb"

describe Bill do
  describe "bill" do
    bill = Bill.new
    item = PurchaseItem.new({ name: 'book', quantity: 1, price: 10.00, is_exempt: true, is_imported: false })
    bill.add_item(item)

    it "should have 1 item in the list" do
      expect(bill.items.length).to eql(1)
    end
  end

  describe "bill" do
    bill = Bill.new
    item1 = PurchaseItem.new({ name: 'book', quantity: 1, price: 12.49, is_exempt: true, is_imported: false })
    bill.add_item(item1)

    item2 = PurchaseItem.new({ name: 'chocolate', quantity: 1, price: 0.85, is_exempt: true, is_imported: false })
    bill.add_item(item2)

    item3 = PurchaseItem.new({ name: 'music cd', quantity: 1, price: 16.49, is_exempt: false, is_imported: false })
    bill.add_item(item3)

    it "should have 3 items" do
      expect(bill.items.length).to eql(3)
    end

    it "should have total price equal to the sum of price of each item" do
      expect(bill.total).to eql(item1.total + item2.total + item3.total)
    end

    it "should have sales taxes equal to the sum of tax of each item" do
      expect(bill.sales_taxes).to eql(item1.sales_taxes + item2.sales_taxes + item3.sales_taxes)
    end
  end
end
