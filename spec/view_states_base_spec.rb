require 'spec_helper'

describe ViewStates::Base do
  let(:obj) { Object.new }
  subject { ViewStates::Base.new(obj) }

  it "responds to states" do
    subject.should respond_to(:states)
  end
  
  it "starts with states as an empty array" do
    subject.states.should be_kind_of(Array)
    subject.states.should be_empty
  end

  describe "#add_state" do
    it "add the method name with no prefix if returns true" do
      obj.stub(:tainted? => true)
      subject.add_state(:tainted?)
      subject.states.should include('tainted')
    end

    it "adds the method name prefixed with not if returns false" do
      obj.stub(:tainted? => false)
      subject.add_state(:tainted?)
      subject.states.should include('not_tainted')
    end
  end
end
