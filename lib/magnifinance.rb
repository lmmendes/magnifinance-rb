$:.unshift File.expand_path(File.dirname(__FILE__))

require "savon"

require "magnifinance/version"
require "magnifinance/configuration"
require "magnifinance/helpers"
require "magnifinance/client"
require "magnifinance/invoice"
require "magnifinance/model/invoice"

module Magnifinance
  extend Configuration

  def self.new(options={})
    Client.new(options)
  end

end
