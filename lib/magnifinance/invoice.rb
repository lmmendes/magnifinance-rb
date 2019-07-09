module Magnifinance
  class Invoice
    include Magnifinance::Helpers

    attr_reader :client

    def initialize(client)
      @client = client
    end

    def find(invoice_id)
      payload = prefix_hash(:invoice, {id: invoice_id})
      client.call(:invoice_get, payload)
    end

    def create(options = {})
      payload = {}
      payload[:client] = prefix_hash(:client, options.fetch(:client))
      payload[:client][:ClientNIF!] = payload[:client].delete(:client_nif) if payload[:client][:client_nif]

      payload[:invoice] = prefix_hash(:invoice, options.fetch(:invoice), [:tax_exemption_reason_code])
      payload[:invoice][:produts] = options.fetch(:products).collect do |p|
        { invoice_product: prefix_hash('product', p ,[:tax_value, :product_discount, :cost_center]) }
      end
      payload[:is_to_close] = options.fetch(:is_to_close, false)
      if options.fetch(:send_by_email_to_asddress, nil)
        payload[:send_by_email_to_asddress] = options.fetch(:send_by_email_to_asddress)
      end
      client.call(:invoice_create, payload)
    end

    def all(options={page_number: 1, page_size: 10})
      options = options.merge(options)
      response = client.call(:invoice_list, options)
      if response.success?
        response.to_array(:invoice_list_response, :invoice_list, :document_details).map{ |o| Magnifinance::Model::Invoice.new(o) }
      else
        raise Magnifinance::Exception.new("Can't invoice list")
      end
    end

  end
end
