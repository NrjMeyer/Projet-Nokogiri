require 'open-uri'
require 'nokogiri'

def cours_cryptomonnnaies
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    tab_cours_actuel = []
    cours_actuel = Hash.new(0)
    puts "*********************************************************************"
    puts "                       CHARGEMENT                                    "
    puts "*********************************************************************"
    sleep 2
    puts "PATIENTEZ SVP"
    element_tab = page.css("#currencies-all tbody tr")[0..12]
    for i in 0...11 do
        x = page.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ")
        cours_actuel[:name] = x[2]
        cours_actuel[:symbol] = x[3]
        cours_actuel[:market_cap] = x[4]
        cours_actuel[:price] = x[5]
        cours_actuel[:circulating_suply] = x[6]
        cours_actuel[:volume] = x[7]
        cours_actuel[:percent_1_h] = x[8]
        cours_actuel[:percent_24_h] = x[9]
        cours_actuel[:percent_7_d] = x[10]
        tab_cours_actuel << cours_actuel    
        })
    end
    tab_cours_actuel
end

#Boucle infini qui se lance chaque une heure 
while 0 != 1
    puts cours_cryptomonnnaies
    sleep 3600
end 
