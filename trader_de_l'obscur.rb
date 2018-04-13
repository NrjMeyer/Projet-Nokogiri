require 'open-uri'
require 'nokogiri'

def cours_cryptomonnnaies
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    cours_acutel = Hash.new(0)
    puts "*********************************************************************"
    puts "                       CHARGEMENT                                    "
    puts "*********************************************************************"
    sleep 2
    puts "PATIENTEZ SVP"
    element_tab = page.css("#currencies-all tbody tr")[0..12]
    for i in 0...11 do
        x = page.css("#currencies-all tbody tr")[i].text.split("\n").join(" ")[2..-1].split(" ")
        cours_actuel.push({
            :name => x[2],
            :symbol => x[3],
            :market_cap => x[4],
            :price => x[5],
            :circulating_supply => x[6],
            :volume => x[7],
            :percent_1_h => x[8],
            :percent_24_h => x[9],
            :percent_7_d =>x[10]
        })
    end
    cours_actuel
end

#Boucle infini qui se lance chaque une heure 
while 0 != 1
    puts cours_cryptomonnnaies
    sleep 3600
end 
