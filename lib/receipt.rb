require 'csv'

class Receipt
  
  def print_receipt(input)
    
    products = process_input(input)
    calculator = Calculator.new
    
    CSV.open("receipt.csv", "wb") do |csv|
      taxes = 0
      total = 0
      
      products.each do |product|
        cost = calculator.total(product)  
        csv << [product[:qty], product[:name], "%.2f" % cost]
        taxes += calculator.tax(product[:name], product[:price])
        total += cost
      end
      csv << ["Sales Taxes: %.2f " % taxes]
      csv << ["Total: %.2f " % total]
    end

  end
  
  def process_input(input)

    #break up input by line and remove the column header row
    items = input.split("\n")
    items.shift 
    
    items.map do |row|
      row = row.split(', ')
      item = {
        :qty => row[0].to_i,
        :name => row[1],
        :price => row[2].to_f
      }
    end    
  end
  
end
