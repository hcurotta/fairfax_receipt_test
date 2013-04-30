require 'spec_helper'

describe Calculator do
  before :all do 
    @calculator = Calculator.new
  end

  describe "#tax" do    
  
    it "should calculate only sales tax for taxable domestic products" do
      @tax_total = @calculator.tax("music cd", 14.99)
      @tax_total.should == 1.5
    end
    
    it "should calculate no tax for domestic tax-exempt products" do
      @tax_total = @calculator.tax("book", 12.49)
      @tax_total.should == 0
    end
    
    it "should calculate only import tax for imported tax-exempt products rounding up" do
      @tax_total = @calculator.tax("imported box of chocolates", 11.25)
      @tax_total.should == 0.6
    end
    
    it "should calculate only import tax for imported taxable products" do
      @tax_total = @calculator.tax("imported bottle of perfume", 47.50)
      @tax_total.should == 7.15
    end
  end
  
  describe "#tax_rate" do
    it "should return 10 for domestic taxable" do
      rate = @calculator.tax_rate("music cd")
      rate.should == 10
    end
    it "should return 15 for imported taxable" do
      rate = @calculator.tax_rate("imported bottle of perfume")
      rate.should == 15
    end
    it "should return 0 for domestic exempt" do
      rate = @calculator.tax_rate("book")
      rate.should == 0
    end
    it "should return 5 for imported exempt" do
      rate = @calculator.tax_rate("imported box of chocolates")
      rate.should == 5
    end
  end
  
  describe "#is_exempt?" do
    it "should return true for books/medical/food" do
      exempt = @calculator.is_exempt?("imported box of chocolates")
      exempt.should be == true
    end
    
    it "should return false unless books/medical/food" do
      exempt = @calculator.is_exempt?("book")
      exempt.should be == true
    end
  end
  
  describe "#is_imported" do
    it "should return true if imported in name" do
      imported = @calculator.is_imported?("imported bottle of perfume")
      imported.should be == true
    end
    it "should return false if imported not in name" do
      imported = @calculator.is_imported?("music cd")
      imported.should be == false
    end
  end
  
  describe "#total" do
    it "should return total price for product including tax" do
      total = @calculator.total({:name => "imported bottle of perfume", :qty => 2, :price => 47.50})
      total.should == 109.30
    end
  end
  
  describe "#round_to_5_cents" do
    it "should round up to the nearest 5 cents" do
      rounded_amount = @calculator.round_to_5_cents(3.23)
      rounded_amount.should == 3.25
    end
  end
end