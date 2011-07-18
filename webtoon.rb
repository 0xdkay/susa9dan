require 'rubygems'
require 'mechanize'

days = Hash.new
days['mon'] = ['크리퍼스큘']
days['tue'] = ['마음의소리']
days['wed'] = ['지금 우리 학교는']
days['wed'] += ['특수 영능력 수사반']
days['thu'] = ['패션왕']
days['thu'] += ['치즈인더트랩']
days['fri'] = ['마음의소리']
days['sun'] = ['탈(TAL)']

agent = Mechanize.new 
naver = agent.get "http://comic.naver.com/webtoon/weekday.nhn"
today = naver.search(".//div[@class='col col_selected']//h4")[0]['class']

days[today].to_a.each do |v|
	naver.search(".//div[@class='col col_selected']//ul//li/div//a").each do |t|
		if t['title'] == v
			if t.to_s.include? "ico_updt"
				puts "#{v} is updated ;D"
				puts "Go!!! http://comic.naver.com" + t['href']
#			else
#				puts "#{v} is not updated :("
			end
		end
	end
end	
