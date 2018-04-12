require "./purchase_item.rb"

describe PurchaseItem do
  describe "exempt item" do
    item = PurchaseItem.new({ name: 'book', quantity: 1, price: 10.00, is_exempt: true, is_imported: false })

    it "should have basic sale tax at 0%" do
      expect(item.basic_sales_tax).to eql(0.0)
    end
  end

  describe "non-exempt item" do
    item = PurchaseItem.new({ name: 'music cd', quantity: 1, price: 10.00, is_exempt: false, is_imported: false })

    it "should have basic sale tax at 10%" do
      expect(item.basic_sales_tax).to eql(1.0)
    end
  end

  describe "imported item" do
    item = PurchaseItem.new({ name: 'imported music cd', quantity: 1, price: 10.00, is_exempt: false, is_imported: true })

    it "should have import tax at 5%" do
      expect(item.import_tax).to eql(0.5)
    end
  end

  describe "non-imported item" do
    item = PurchaseItem.new({ name: 'imported music cd', quantity: 1, price: 10.00, is_exempt: false, is_imported: false })

    it "should have import tax at 0%" do
      expect(item.import_tax).to eql(0.0)
    end
  end
end
