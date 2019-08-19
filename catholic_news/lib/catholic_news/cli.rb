class CatholicNews::CLI
	def call
	  list_headlines
		selection
	end
	
	def list_headlines
		puts "Today's Headlines"
		puts "_________________"
		@stories = CatholicNews::News.todays_stories
		@stories.each.with_index(1) do |story, i, i++|
			puts "#{i}. #{story.headline}"
		end
	end
	
	def selection
		input = nil
		
		while input != "exit"
			puts "Options:"
			puts "Enter the number of the story you would like more information on," 
			puts "Type headlines to see the list of headlines again,"
			puts "Or type exit to quit"
			input = gets.strip.downcase
				
				if input.to_i > 0
				  story = @stories[input.to_i-1]
				  puts "#{story.headline}"
				  puts "#{story.teaser}"
				  puts"#{story.link}"
				elsif input == "headlines"
				  list_headlines
				elsif input == "exit"
					finish
				else
				  puts "Invalid entry. Please enter headlines, exit, or a number from the list of headlines."
				end
		end
	end
	
	def finish
	  puts "Thanks for visiting! Check back tomorrow for more news!"
	end
end