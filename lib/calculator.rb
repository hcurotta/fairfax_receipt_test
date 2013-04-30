class Calculator
  EXEMPTIONS = ['book', 'pills', 'chocolate']
  SALES_TAX = 10.0
  IMPORT_DUTY = 5.0
  
  def total(product)
    tax = tax(product[:name], product[:price])
    total = (product[:price] + tax) * product[:qty]
  end
  
  def tax(name, price)
    total = (tax_rate(name) * price)/100
    round_to_5_cents(total)
  end
  
  def tax_rate(name)
    sales_tax = is_exempt?(name) ? 0 : SALES_TAX
    import_tax = is_imported?(name) ? IMPORT_DUTY : 0
    (sales_tax + import_tax)
  end
  
  def is_exempt?(name)
    EXEMPTIONS.each { |exemption| return true if name.include?(exemption) }
    return false
  end
  
  def is_imported?(name)
    name.include?("imported")
  end
  
  def round_to_5_cents(amount)
    (amount*20).ceil / 20.0
  end
end
