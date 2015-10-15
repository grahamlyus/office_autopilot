require 'spec_helper'

describe OfficeAutopilotApi::Client do

  before do
    @api_id = 'foo'
    @api_key = 'bar'
    @client = OfficeAutopilotApi::Client.new(:api_id => @api_id, :api_key => @api_key)
  end

  describe "#new" do
    it "initializes with the given API credentials" do
      @client.api_id.should == @api_id
      @client.api_key.should == @api_key
      @client.auth.should == { 'Appid' => @api_id, 'Key' => @api_key }
    end

    it "raises an ArgumentError when :api_id is not provided" do
      expect {
        OfficeAutopilotApi::Client.new(:api_key => 'foo')
      }.to raise_error(ArgumentError)
    end

    it "raises an ArgumentError when :api_key is not provided" do
      expect {
        OfficeAutopilotApi::Client.new(:api_id => 'foo')
      }.to raise_error(ArgumentError)
    end
  end

  describe "#request" do
    it "makes a HTTP request" do
       pending "can't seem to stub out OfficeAutopilotApi::Request.post"
    end
  end

  describe "#handle_response" do
    context "when there are no errors" do
      it "returns the response verbatim" do
        response = '<result>Success</result>'
        @client.handle_response(response).should == response
      end
    end

    context "when the email contains 'failure'" do
      it "does not raise an error" do
        expect {
            puts @client.handle_response( test_data('contacts_add_response2.xml') )
        }.not_to raise_error
      end
    end

    context "invalid XML error" do
      it "raises OfficeAutopilotApi::XmlError" do
        expect {
            @client.handle_response( test_data('invalid_xml_error_response.xml') )
        }.to raise_error(OfficeAutopilotApi::XmlError)
      end
    end
  end

end
