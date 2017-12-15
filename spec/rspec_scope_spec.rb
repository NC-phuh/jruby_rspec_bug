module Prepender
end

class FakeClass
  prepend Prepender

  def fake_method(arg)
    return {}
  end
end

describe FakeClass do

  context "When a test stubs the prepended class" do
    it "should not persist this stub" do
      allow_any_instance_of(FakeClass)
        .to receive(:fake_method)
        .with("random argument")
        .and_return("returned value")
    end
  end

  context "when the class is no longer stubbed" do
    it "should not be affected by other tests" do
      expect(FakeClass.new.fake_method("non-random")).to eq({})
    end
  end

end