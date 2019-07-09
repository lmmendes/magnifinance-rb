require 'spec_helper'

RSpec.describe Magnifinance::Client do

  it "has username and password set" do
    client = described_class.new(email: 'mock-email', token: 'mock-token')
    expect(client.email).to eq('mock-email')
    expect(client.token).to eq('mock-token')
  end

  it "has default wsdl set" do
    client = described_class.new(email: '', token: '')
    expect(client.wsdl).to eq('https://app.magnifinance.com/Magni_API/Magni_API.asmx?WSDL')
  end

  it "set custom wsdl" do
    new_wsdl = 'https://example.org?WSDL'
    client = described_class.new(email: '', token: '', wsdl: new_wsdl)
    expect(client.wsdl).to eq(new_wsdl)
  end

  it "has default user agent" do
    client = described_class.new(email: '', token: '')
    expect(client.wsdl).to eq(Magnifinance::Configuration::DEFAULT_WSDL)
  end

  it "set custom user agent" do
    new_user_agent = 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; Trident/4.0)';
    client = described_class.new(email: '', token: '', user_agent: new_user_agent)
    expect(client.user_agent).to eq(new_user_agent)
  end

end
