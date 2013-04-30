require 'spec_helper'
 
describe Receipt do
  before :all do 
    @receipt = Receipt.new
    @input = "Quantity, Product, Price\n1, book, 12.49\n1, music cd, 14.99\n1, chocolate bar, 0.85"
    @input2 = "Quantity, Product, Price\n1, imported box of chocolates, 10.00\n1, imported bottle of perfume, 47.50"
    @input3 = "Quantity, Product, Price\n1, imported bottle of perfume, 27.99\n1, bottle of perfume, 18.99\n1, packet of headache pills, 9.75\n1, box of imported chocolates, 11.25"
    
  end
 
  describe "#process_input" do
    before :each do
      @items = @receipt.process_input(@input)
    end

    it "should return an array" do
      @items.should be_an_instance_of Array
    end
    
    it "should return an array of hashes" do
      @items.each do |item|
       item.should be_an_instance_of Hash
      end
    end
  end
  
  describe "#print_receipt" do
    it "should generate csv with correct totals (input1)" do

      @receipt.print_receipt(@input)

      expected_csv = File.read('expected_1.csv')
      generated_csv = File.read('receipt.csv')

      generated_csv.should == expected_csv
    end
    
    it "should generate csv with correct totals (input2)" do

      @receipt.print_receipt(@input2)

      expected_csv = File.read('expected_2.csv')
      generated_csv = File.read('receipt.csv')

      generated_csv.should == expected_csv
    end
    
    it "should generate csv with correct totals (input3)" do

      @receipt.print_receipt(@input3)

      expected_csv = File.read('expected_3.csv')
      generated_csv = File.read('receipt.csv')

      generated_csv.should == expected_csv
    end
  end
  
end