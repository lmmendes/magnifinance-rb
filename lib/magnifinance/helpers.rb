module Magnifinance
  module Helpers
    def prefix_hash(prefix, hash, ignore_keys=[])
      hash.map do |k,v|
        if ignore_keys.empty? || !ignore_keys.include?(k)
          ["#{prefix}_#{k}".to_sym, v]
        else
          [k, v]
        end
      end.to_h
    end
  end
end
