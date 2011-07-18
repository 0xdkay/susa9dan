require 'rubygems'
require 'mechanize'

agent = Mechanize.new 
titles = agent.get "http://comic.naver.com/webtoon/list.nhn?titleId=15568&weekday=thu"
recent = titles.search(".//td[@class='title']/a").to_a[0].text
if recent.include? "("
	if recent.include? "(마지막)"
		puts "Webtoon Time!"
	else
		puts "Time for sleep!"
	end
else
	puts "Webtoon Time!"
end
