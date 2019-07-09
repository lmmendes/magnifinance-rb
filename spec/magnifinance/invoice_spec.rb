require 'spec_helper'

RSpec.describe Magnifinance::Invoice do

  before(:all) { savon.mock!   }
  after(:all)  { savon.unmock! }

  subject(:client){ Magnifinance::Client.new }

  it "get invoices" do
    fixtures = File.read('spec/fixtures/invoice/invoice_get.xml')
    savon.expects(:invoice_list).with(message: mock_payload(page_number: 1, page_size: 10)).returns(fixtures)
    c = Magnifinance.new(email: MagnifinanceHelper::DEFAULT_EMAIL, token: MagnifinanceHelper::DEFAULT_TOKEN)
    invoices = c.invoices.all
    expect(invoices.size).to eq(4)
  end

end
