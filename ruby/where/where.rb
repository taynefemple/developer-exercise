
module Whereable
  def where(args)
    args.each do |arg_key, arg_val|
      self.keep_if do |person|
        if arg_val.is_a?(Numeric)
          arg_val == person[arg_key]
        else arg_val.match(person[arg_key])
        end
      end
    end
    self
  end
end

class Array
  include Whereable
end
