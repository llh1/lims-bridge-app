require 'lims-bridge-app/sample/spec_helper'
require 'lims-bridge-app/sample/json_decoder'

module Lims::BridgeApp::SampleManagement
  describe JsonDecoder do
    before do
      @decoder = Class.new do
        include JsonDecoder
      end.new
    end

    context "sample decoders" do
      it "gets the right decoder for a sample message" do
        @decoder.json_decoder_for("sample").should == JsonDecoder::SampleJsonDecoder 
      end

      it "gets the right decoder for a bulk create sample message" do
        @decoder.json_decoder_for("bulk_create_sample").should == JsonDecoder::BulkCreateSampleJsonDecoder
      end

      it "gets the right decoder for a bulk update sample message" do
        @decoder.json_decoder_for("bulk_update_sample").should == JsonDecoder::BulkUpdateSampleJsonDecoder
      end

      it "gets the right decoder for a bulk delete sample message" do
        @decoder.json_decoder_for("bulk_delete_sample").should == JsonDecoder::BulkDeleteSampleJsonDecoder
      end
    end
  end
end
