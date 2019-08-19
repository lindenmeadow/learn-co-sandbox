class CatholicNews::News
	attr_accessor :doc, :headline, :teaser, :link
	
  def self.todays_stories
    self.scrape_stories
  end
	
	def self.scrape_stories
	  stories = []
	  
	  stories << self.scrape_page
	  
	  stories
	end
	
	def self.scrape_page
	    doc = Nokogiri::HTML(open("https://www.catholicnewsagency.com/headlines"))
			story = self.new
			story.headline = doc.search("div.noticia_list_title").text.strip
			story.teaser = doc.search("div.noticia_list_body").text.strip
			story.link = doc.search("a").attr("href").text.strip
	    story
	end
end