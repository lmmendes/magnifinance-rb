module Magnifinance
  module Configuration

    DEFAULT_USER_AGENT = "Mozilla/5.0 (compatible; Magnifinance Ruby API Client/#{Magnifinance::VERSION}; +https://github/lmmendes/magnifinance-rb)".freeze
    DEFAULT_WSDL  = "https://app.magnifinance.com/Magni_API/Magni_API.asmx?WSDL".freeze
    CONFIG_KEYS = %i[wsdl email token user_agent proxy].freeze

    attr_accessor(*CONFIG_KEYS)

    def reset
      self.wsdl = DEFAULT_WSDL
      self.token = nil
      self.email = nil
      self.user_agent = DEFAULT_USER_AGENT
      self.proxy = nil
    end

    def configure
      yield self
    end

    def options
      Hash[ *CONFIG_KEYS.map{ |key| [key, send(key)] }.flatten ]
    end

    def self.extended(base)
      base.reset
    end

  end
end
