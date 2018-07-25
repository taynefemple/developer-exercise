

module Whereable
  def where(args)
    @whered = self.clone
    args.each do |arg_key, arg_val|
      @whered.select! do |person|
        if arg_val.is_a?(Numeric)
          arg_val == person[arg_key]
        else arg_val.match(person[arg_key])
        end
      end
    end
    @whered
  end
end

class Array
  include Whereable
end
