require "spec_helper"
require "hash_assertions/assert_keys_with_values"

describe "assert_keys_with_values" do
  let(:hash) { { foo: "bar", baz: "qux", bar: nil, qux: "" } }

  context "when all provided keys have present values" do
    let(:present_keys?) { [:foo, :baz] }

    it "passes" do
      expect { hash.assert_keys_with_values(*present_keys?) }.to_not raise_error
    end
  end

  context "when some keys with nil values" do
    let(:present_keys?) { [:baz, :bar] }

    it "fails" do
      expect do
        hash.assert_keys_with_values(*present_keys?)
      end.to raise_error(ArgumentError, "Blank value for key: bar")
    end
  end

  context "when some keys with empty values" do
    let(:present_keys?) { [:baz, :qux] }

    it "fails" do
      expect do
        hash.assert_keys_with_values(*present_keys?)
      end.to raise_error(ArgumentError, "Blank value for key: qux")
    end
  end

  context "when using strings for keys" do
    let(:present_keys?) { ["foo", "baz"] }

    it "fails" do
      expect do
        hash.assert_keys_with_values(*present_keys?)
      end.to raise_error(ArgumentError, "Blank value for key: foo")
    end
  end

  context "when not splatting keys array" do
    let(:present_keys?) { [:baz, :bar] }

    it "fails" do
      expect do
        hash.assert_keys_with_values(present_keys?)
      end.to raise_error(ArgumentError, "Blank value for key: [:baz, :bar]")
    end
  end
end
