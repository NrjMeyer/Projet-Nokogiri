require 'rubygems'
require 'nokogiri'
require 'open-uri'

#Méthode qui récupère l'adresse email à partir de l'url d'une mairie
def get_the_email_of_a_townhal_from_its_webpage(page_url)
    page = Nokogiri::HTML(open("#{page_url}"))
    element = page.css(".txt-primary")[3].text.split(" ")[2]
    element
end

#Méthode qui récupère tout les urls de villes de val d'oise
def get_all_the_urls_of_val_doise_townhalls
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    liens = page.css(".lientxt")
    lien = []
    liens.each do |x|
        lien << "http://annuaire-des-mairies.com" + x['href'][1..-1]
    end
    lien
end

#Méthode qui récupère tout les noms de villes de val d'oise
def get_all_name
    page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    names = []
    name = page.css(".lientxt")
    name.each do |x|
       names << x.text
    end
    names
end


#Pour les faires afficher un par un (dans un hash)
list_email = []

#On fait appel à ces trois foncions précedents 
list_url = get_all_the_urls_of_val_doise_townhalls
list_name = get_all_name
my_tab_hash = []

list_url.each do |url|
    list_email << get_the_email_of_a_townhal_from_its_webpage(url)
    end

for i in 0...list_url.length
    my_hash = {
        name: "",
        email: ""
    }
    my_hash[:name] = list_name[i]
    my_hash[:email] = list_email[i]
    my_tab_hash << my_hash
end

puts my_tab_hash