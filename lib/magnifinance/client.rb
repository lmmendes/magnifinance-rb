module Magnifinance
  class Client
    include Magnifinance::Helpers

    attr_accessor(*Configuration::CONFIG_KEYS)

    def initialize(options={})
      merge_options = Magnifinance.options.merge(options)
      Configuration::CONFIG_KEYS.each do |key|
        self.send("#{key}=", merge_options[key])
      end
    end

    def call(method, payload)
      soap_client.call(method, message: authentication.merge(payload))
    end

    def soap_client(options={})
      options = client_options.merge(options)
      @soap_client ||= Savon.client(options)
    end

    def invoices
      @invoices ||= Invoice.new(self)
    end

    protected
    def client_options
      {
        convert_request_keys_to: :camelcase,
        wsdl: wsdl,
        log: true,
        proxy: proxy,
        log_level: :debug,
        filters: [],
        pretty_print_xml: true,
        namespace: 'http://www.outsystems.com',
        namespaces: {
          'xmlns' => 'http://www.outsystems.com'
        }
      }
    end

    def authentication
      {
        authentication: {
          login_email: email,
          login_token: token
        }
      }
    end

  end
end
