require 'capybara'
=begin
Sample code using capybara (with selenium) that logins to gmail account and prints unread email count
Please feel free to play around with different browsers. Also dont forget to update username and password 
=end

#Default driver as selenium 
session = Capybara::Session.new(:selenium)

#change wait time to 10 (default is 2). Also there must be a better wait to explicitly wait !!
Capybara.default_max_wait_time = 10

#open gmail
session.visit("https://www.gmail.com/")

#enter username
session.fill_in('Email', :with => 'uname') #change here
session.click_button('next')

#enter password
session.fill_in('Passwd', :with => 'pwd') #change here
session.click_button('signIn')

#get the rquired text that has unread count
title = session.find(:xpath, "//*[@id=':j9']/div/div[2]/span/a").text

#if above doesnt work, try below
#title2 = session.find_link("Inbox").text

#get the required text
count = title.split('(',2).last
count = count.split(')').first

#print
puts count

#logout from gmail
session.find(:xpath, "//*[@id='gb']/div[1]/div[1]/div[2]/div[4]/div[1]/a").click
session.click_link("Sign out")