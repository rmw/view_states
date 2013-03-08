module ViewStates
  class Base
    attr_reader :states

    def initialize(obj)
      @obj = obj
      @states = []
    end

    def add_state(stateful_attr)
      res = @obj.send(stateful_attr)
      state = stateful_attr.to_s.gsub(/[^a-z ]/, '')
      @states << state if res
      @states << "not_#{state}" if !res
    end
  end
end
