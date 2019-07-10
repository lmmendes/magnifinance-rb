# Magnifinance
[![Build Status](https://travis-ci.org/lmmendes/magnifinance-rb.svg?branch=master)](https://travis-ci.org/lmmendes/magnifinance-rb)
[![Gem Version](https://badge.fury.io/rb/magnifinance.svg)](https://badge.fury.io/rb/magnifinance)
[![Maintainability](https://api.codeclimate.com/v1/badges/92cd79a903ed2816cb7c/maintainability)](https://codeclimate.com/github/lmmendes/magnifinance-rb/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/92cd79a903ed2816cb7c/test_coverage)](https://codeclimate.com/github/lmmendes/magnifinance-rb/test_coverage)

magnifinance-rb is a MagniFinance SOAP API client for Ruby.

This is a work in progress (wip), please check the [development](#development) status.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'magnifinance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install magnifinance

## Usage

You'll need to get a username (email) and access token from MagniFinance at https://magnifinance.com/

```ruby
require 'magnifinance'
client = Magnifinance::Client.new(email: 'your@email.org', token: 'your-token')
```

### Get all invoices

```ruby
invoices = client.invoces.all
```

### Get a invoice

```ruby
invoice = client.invoices.find('FT FT/1')
```

### Create invoice

```ruby
invoice_params = {
  client: {
    nif: '999999990',
    name: 'Consumidor Final',
    address: 'Lisbon',
    zip_code: '1500-000',
    country_code: 'PT'
  },
  invoice: {
    date: '2019-07-08',
    description: 'Awesome product invoice',
    type: 'I',
    euro_rate: 23.0
  },
  products = []
}
invoice = client.invoices.create(invoice_params)
```

## Development

This is the current development status, methods with [x] are already implemented:

- [ ] receipt_create,
- [ ] waybill_create,
- [ ] invoice_payment,
- [ ] receipt_get,
- [ ] waybill_get,
- [ ] invoice_cancel,
- [ ] client_get_data,
- [ ] invoice_add_mb_reference,
- [x] invoice_get,
- [ ] saft_get,
- [x] invoice_list,
- [ ] create_subscription,
- [ ] product_get_default,
- [ ] series_get_by_document_type,
- [x] invoice_create,
- [ ] client_change_locale,
- [ ] get_company_info_by_vat

If you find that the API has another methods that are not declared here, please [open a issue](https://github.com/lmmendes/magnifinance-rb/issues).

## Bug reports and other issues

* https://github.com/lmmendes/magnifinance-rb/issues

## Help and Docs

* https://github.com/lmmendes/magnifinance-rb/wiki

## Contributing

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Send me a pull request. Bonus points for topic branches.

## License

Magnifinance is free software distributed under the terms of the MIT license reproduced [here](http://opensource.org/licenses/mit-license.html).
