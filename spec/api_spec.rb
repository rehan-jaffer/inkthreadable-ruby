require 'spec_helper'

describe Inkthreadable::API do
  describe Inkthreadable::API::Request do

    describe "#transform_params" do
      it "transforms a hash into query string" do
        expect(Inkthreadable::API::Request.transform_params({sample: "variable"})).to eq "sample=variable"
      end
      it "encodes html entities properly" do
        expect(Inkthreadable::API::Request.transform_params({sample: "variable two"})).to eq "sample=variable+two"
      end
    end

    describe "#sign_query_string" do

    end

  end

  describe Inkthreadable::API::Response do
  end
end
