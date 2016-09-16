=begin
require 'watir'
require 'watir-webdriver'

browser = Watir::Browser.new:chrome
browser.goto 'http://bit.ly/watir-example'
browser.text_field(:name => "entry.1000000").set('Watir')
browser.text_field(:name => "entry.1000001").set("I come here from Australia. \nThe weather is great here.")
browser.radio(:value => "Watir").set
browser.checkbox(:value => "Ruby").set
browser.checkbox(:value => "Python").set
browser.checkbox(:value => "Python").clear
puts browser.select_list(:name => "entry.1000004").options
browser.select_list(:name => "entry.1000004").select("Chrome")

sleep(10)
browser.button(:name => "submit").click
=end
=begin
require 'watir'
require 'watir-webdriver'
browser = Watir::Browser.Start("http://www.baidu.com/")
=end

require "watir"
require "watir-webdriver"
require 'nokogiri'

browser = Watir::Browser.new:chrome
browser.goto("http://www.hao123.com/")
browser.text_field(:id => "search-input").set("ruby")
browser.button(:xpath => '//*[@id="search-form"]/div[2]/input').click
sleep(2)
#page = Nokogiri::HTML(browser.windows[1].html())
#p page.class
browser.windows.last.use
#p browser.text
page = Nokogiri::HTML(browser.html)
#link = page.search('div a[1]')
p page.xpath("//h3[@class='t c-title-en']").text

browser.close