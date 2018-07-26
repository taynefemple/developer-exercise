
module Whereable
  def where(match_items)
    @matching = self.clone
    match_items.each do |key, search_val|
      @matching.keep_if do |el|
        evaluate_match(search_val, el[key])
      end
    end
    @matching
  end

  private

  def evaluate_match(search_val, hash_value)
    if search_val.is_a?(Numeric)
      search_val == hash_value
    else
      search_val.match(hash_value)
    end
  end
end

class Array
  include Whereable
end
