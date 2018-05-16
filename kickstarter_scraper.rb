# require libraries/modules here

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)

  projects = {}

  kickstarter.css("#projects_list .project.grid_4").each do |project_card|
    title = project_card.css(".bbcard_name strong a").text
    projects[title.to_sym] = {
      image_link: project_card.css(".project-thumbnail a img").attribute("src")
      description: project_card.css("p.bbcard_blurb").text
    }#end projects hash
  end

  projects
end
