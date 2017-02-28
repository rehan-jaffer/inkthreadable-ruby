require 'spec_helper'

module Inkthreadable
    describe Setup do
      describe "#app_id" do
        it "can set app_id" do
          config = Inkthreadable::Setup::Configuration.new
          config.app_id = "valid app_id string"
          expect(config.app_id).to eq "valid app_id string"
        end
      end
    end
end
