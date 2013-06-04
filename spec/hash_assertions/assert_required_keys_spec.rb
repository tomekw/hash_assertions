require "spec_helper"
require "hash_assertions/assert_required_keys"

describe "assert_required_keys" do
  let(:hash) { { foo: "bar", baz: "qux" } }

  context "when all required keys in hash" do
    let(:required_keys) { [:foo, :baz] }

    it "passes" do
      expect { hash.assert_required_keys(*required_keys) }.to_not raise_error
    end
  end

  context "when some keys missing" do
    let(:required_keys) { [:foo, :baz, :bar] }

    it "fails" do
      expect do
        hash.assert_required_keys(*required_keys)
      end.to raise_error(ArgumentError, "Missing required key: bar")
    end
  end

  context "when using strings for required keys" do
    let(:required_keys) { [:foo, "baz"] }

    it "fails" do
      expect do
        hash.assert_required_keys(*required_keys)
      end.to raise_error(ArgumentError, "Missing required key: baz")
    end
  end

  context "when not splatting required keys array" do
    let(:required_keys) { [:foo, :baz] }

    it "fails" do
      expect do
        hash.assert_required_keys(required_keys)
      end.to raise_error(ArgumentError, "Missing required key: [:foo, :baz]")
    end
  end
end
