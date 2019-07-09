require 'ostruct'

module Magnifinance
  module Model
    class Invoice < OpenStruct
      INVOICE_TYPES = %W(B C D I P S T W Y Z)
    end
  end
end
