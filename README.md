# TickerSymbolJpn

Acquire ticker symbol and company name from Japan Exchange Group.
Only Japan data.

証券コードと会社名を東京証券取引所のデータから取得するGEMです。

## Notice

TickerSymbolJpn is used Web scraping. Therefore be careful about excessive access to a Web server.
Please use weather data which is written by your program in a file.

Webサーバーから毎回データを取得してくるため、Webサーバーに負荷がかかる可能性があります。使用する時はなるべく下記のようにファイルに書き出して使用してください。

```ruby
# example
save_code "codes.json"
codes = load_code "codes.json"
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ticker_symbol_jpn'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ticker_symbol_jpn

## Usage

Data is hash data. Key is ticker symbol data and value is company name.

```ruby
codes = TickerSymbolJpn.all_codes
p codes[3904] #=> "カヤック"
```

## Methods

### all_codes

All ticker symbol data.

### first_codes

Data of Tokyo Stock Exchange 1st section.

### second_codes

Data of Tokyo Stock Exchange 2nd section.

### mothers_codes

Data of Mothers.

### jasdaq_codes

Data of JASDAQ

### save_code(json_file_path)

Save to json_file_path.

### load_code(json_file_path)

Load from json_file_path.
Return hash data.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ticker_symbol_jpn/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
