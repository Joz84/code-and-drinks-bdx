# Round.destroy_all
# Exercice.destroy_all
# # CityQuarter.destroy_all

# # CityQuarter.create!(title: "Qrt 3 - Bdx")
# Exercice.create!(title: "Simple multiplication", url: "583710ccaa6717322c000105")
# Exercice.create!(title: "MakeUpperCase", url: "57a0556c7cb1f31ab3000ad7")

# Round.create!(exercice: Exercice.first, city_quarter: CityQuarter.first, rank: 1)
# Round.create!(exercice: Exercice.second, city_quarter: CityQuarter.first, rank: 1)

url= "https://raw.githubusercontent.com/Rjumeau/challenges-data/main/challenges_data.json"

params_list = JSON.parse(RestClient.get(url).body)
params_list.each do |params|
    Exercice.create!(
        title: params["name"],
        url: params["url"],
        kata: params["kata"]
    )
end
