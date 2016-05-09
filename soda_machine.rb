class SodaMachine
  attr_reader :sodas, :cash

  def initialize(args = {})
    @sodas = args[:sodas]
    @cash = args[:cash]
  end

  def current_inventory_count
    @sodas.count
  end

  def find_soda(soda_brand)
    soda = @sodas.select{ |item| item.brand == soda_brand}
    soda = soda[0]
  end

  def sell(soda_brand)
    soda = find_soda(soda_brand)
    if soda != nil
      @cash += soda.price
      idx_to_remove = 0
      @sodas.each_with_index do |item, index| 
        if item.object_id == soda.object_id
          idx_to_remove = index
        end
      end
      sodas.delete_at(idx_to_remove)
    end
  end

end
