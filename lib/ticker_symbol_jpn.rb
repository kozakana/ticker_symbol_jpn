require "ticker_symbol_jpn/version"
require 'open-uri'
require 'json'
require 'spreadsheet'

module TickerSymbolJpn extend self
  FIRST_LINE = "コード"
  SHEET_NAME = "Sheet1"

  FIRST_URL = [
    "http://www.jpx.co.jp/markets/statistics-equities/misc/tvdivq0000001vg2-att/first-d-j.xls",
    "http://www.jpx.co.jp/markets/statistics-equities/misc/tvdivq0000001vg2-att/first-f-j.xls"
  ]
  SECOND_URL = [
    "http://www.jpx.co.jp/markets/statistics-equities/misc/tvdivq0000001vg2-att/second-d-j.xls",
    "http://www.jpx.co.jp/markets/statistics-equities/misc/tvdivq0000001vg2-att/second-f-j.xls"
  ]
  MOTHERS_URL = [
    "http://www.jpx.co.jp/markets/statistics-equities/misc/tvdivq0000001vg2-att/mothers-d-j.xls",
    "http://www.jpx.co.jp/markets/statistics-equities/misc/tvdivq0000001vg2-att/mothers-f-j.xls"
  ]

  def all_codes
    urls = FIRST_URL + SECOND_URL + MOTHERS_URL
    get_codes urls
  end

  def first_codes
    get_codes FIRST_URL
  end

  def second_codes
    get_codes SECOND_URL
  end

  def mothers_codes
    get_codes MOTHERS_URL
  end

  def save_codes json_file_path
    codes = all_codes
    open(json_file_path, 'w') do |io|
      JSON.dump(codes, io)
    end
  end

  def load_codes json_file_path
    json_data = open(json_file_path) do |io|
      JSON.load(io)
    end
    json_data.keys.each do |key|
      json_data[(Integer(key) rescue key) || key] = json_data.delete(key)
    end
    json_data
  end

  private
  def get_codes urls
    codes = {}

    urls.each do |url|
      book = Spreadsheet.open(open(url))
      book.worksheet(SHEET_NAME).rows.each do |line|
        next if line[1] == FIRST_LINE
        codes[line[1].to_i] = line[2]
      end
    end
    codes
  end
end
