require './lib/receipt'
require './lib/calculator'

# input 1
# input = "Quantity, Product, Price\n1, book, 12.49\n1, music cd, 14.99\n1, chocolate bar, 0.85"

# input 2
input = "Quantity, Product, Price\n1, imported box of chocolates, 10.00\n1, imported bottle of perfume, 47.50"

# input 3
# input = "Quantity, Product, Price\n1, imported bottle of perfume, 27.99\n1, bottle of perfume, 18.99\n1, packet of headache pills, 9.75\n1, box of imported chocolates, 11.25"


receipt = Receipt.new
receipt.print_receipt(input)