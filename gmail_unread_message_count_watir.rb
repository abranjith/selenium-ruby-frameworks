require "watir-webdriver"

=begin
Sample code using watir-webdriver for selenium that logins to gmail account and prints unread email count
Please feel free to play around with different browsers. Also dont forget to update username and password 
=end

#ensure chrome driver exe is in your PATH
browser = Watir::Browser.new :chrome
browser.goto "https://www.gmail.com/"

#enter username
browser.text_field(:id => "Email").when_present.set "uname"  #change here
browser.button(:id => "next").click

#enter password
browser.text_field(:id => "Passwd").when_present.set "pwd" #change here
browser.button(:id => "signIn").click

#get the title from Inbox(count) link
title = browser.link(:href => "https://mail.google.com/mail/u/0/#inbox").when_present.title.to_s

#get the required text
count = title.split('(',2).last
count = count.split(')').first

#print
puts count

#logout from gmail
browser.link(:xpath => "//*[@id='gb']/div[1]/div[1]/div[2]/div[4]/div[1]/a").when_present.click
browser.link(:text =>"Sign out").when_present.click

browser.close


