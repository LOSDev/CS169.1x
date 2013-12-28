class CartesianProduct
  include Enumerable
  def initialize(collection1, collection2)
    @collection1 = collection1
    @collection2 = collection2
  end

  def each
  	result = []
    @collection1.each do |valueA|
      @collection2.each do |valueB|
        arr = [valueA, valueB]
        result << arr
      end
    end
    return result
  end
end
