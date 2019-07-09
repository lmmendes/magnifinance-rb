require 'spec_helper'

RSpec.describe Magnifinance::Configuration do

  let(:module_configure) do
    options = subject::CONFIG_KEYS.inject({}){ |h,k| h[k] = k.to_s; h }

    module ModuleConfigure
      extend Magnifinance::Configuration
    end

    options.each do |k, v|
      ModuleConfigure.configure do |config|
        config.send("#{k}=", v)
      end
    end

    ModuleConfigure
  end

  it "has default user agent" do
    user_agent = "Mozilla/5.0 (compatible; Magnifinance Ruby API Client/#{Magnifinance::VERSION}; +https://github/lmmendes/magnifinance-rb)"
    expect(subject::DEFAULT_USER_AGENT).to eq(user_agent)
  end

  it "has default wdsl set" do
    expect(subject::DEFAULT_WSDL).not_to be_nil
  end

  it "has configuration keys" do
    keys = %i(wsdl email token user_agent proxy)
    expect(subject::CONFIG_KEYS).to contain_exactly(*keys)
  end

  it "module #configure" do
    # check if the module
    subject::CONFIG_KEYS.each do |key|
      expect(module_configure.send(key)).to eq(key.to_s)
    end
  end


end
