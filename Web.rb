require "watir"
require "watir-webdriver"
require 'nokogiri'

SLEEP_TIME = 10*60

require 'win32ole'
def Close_chrome()
	begin
	mgmt = WIN32OLE.connect('winmgmts:\\\\.')
	processes = mgmt.instancesof("win32_process")
	processes.each do |process|
		if(process.name == 'chrome.exe') then
			process.terminate()
		end
	end
	rescue
		retry
	end
end

Close_chrome()
browser = Watir::Browser.new:chrome
browser.goto("http://127.0.0.1:8090/speedpro/index")
browser.button(:xpath => '//*[@id="startTask"]').click
sleep(SLEEP_TIME)
browser = Watir::Browser.new:chrome
browser.goto("http://127.0.0.1:8090/speedpro/result/history?isCycleTestOpen=false")
sleep(1)
page = Nokogiri::HTML(browser.html)
text = page.xpath('//*[@id="speedTestResultTableGrid"]/tbody//*[@id="0"]/td[8]').css('div')[0]
browser.goto("http://127.0.0.1:8090/speedpro/result/currResult?testId="+text['id'])
# f = open('a.txt', 'w')
# #f.puts browser.html
page = Nokogiri::HTML(browser.html)
content = page.xpath('/html/body/script/text()').to_s
u_Vmos = /\"uVmos\":([\-\d\.]*)/.match(content)
downloadSpeed = /\"downloadSpeed\":([\-\d\.]*)/.match(content)
upSpeed = /\"upSpeed\":([\-\d\.]*)/.match(content)
videoStallingNumber = /\"videoStallingNumber\":([\-\d\.]*)/.match(content)
cuttonTime = /\"cuttonTime\":([\-\d\.]*)/.match(content)
p u_Vmos[1], downloadSpeed[1], upSpeed[1], videoStallingNumber[1], cuttonTime[1]
browser.close

Close_chrome()