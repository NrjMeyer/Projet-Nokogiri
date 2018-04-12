def get_all_name
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    names = []
    name = page.css(".currency-name-container")
    name.each do |x|
       names << x.text
    end
    names
end



puts get_all_name[0]