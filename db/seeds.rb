require 'open-uri'

puts "Seed started."

User.destroy_all
Place.destroy_all
Rating.destroy_all
puts "  -- Pre-emptive removal of all of DB entries."

#############   HANDICAPS AND CRITERIA OF VOTE FROM USERS   ############
puts "  -- Creation of Criteria of evaluation."

ext = Criterion.create!(name: "Extérieur")
entry = Criterion.create!(name: "Entrée")
movement = Criterion.create!(name: "Circulation dans les locaux")
equip = Criterion.create!(name: "Équipement")
avail = Criterion.create!(name: "Disponibilité")
access = Criterion.create!(name: "Accessibilité")

puts "  -- Criteria generated !"

#### MOTOR
puts "  -- Generating Handicaps."

h = Handicap.create!(name: "Fauteuil manuel")
puts "     -- Generating Detailed Criteria for Handicap [#{h.name}]."
DetailedCriterion.create!(handicap: h, criterion: ext, tooltip: "Visibilité, lisibilité de l’enseigne, praticabilité du cheminement…")
DetailedCriterion.create!(handicap: h, criterion: entry, tooltip: "Porte, rampe…")
DetailedCriterion.create!(handicap: h, criterion: movement, tooltip: "Verticale/Horizontale. Passage de porte, espace accessible jusqu’au service…")
DetailedCriterion.create!(handicap: h, criterion: equip, tooltip: "Sanitaire")
DetailedCriterion.create!(handicap: h, criterion: access, tooltip: "Délocalisation de l’offre, livraison du service, animaux…")
puts "     -- Detailed Criteria generated for Handicap [#{h.name}] !"

h = Handicap.create!(name: "Fauteuil électrique")
puts "     -- Generating Detailed Criteria for Handicap [#{h.name}]."
DetailedCriterion.create!(handicap: h, criterion: ext, tooltip: "Visibilité, lisibilité de l’enseigne, praticabilité du cheminement…")
DetailedCriterion.create!(handicap: h, criterion: entry, tooltip: "Porte, rampe…")
DetailedCriterion.create!(handicap: h, criterion: movement, tooltip: "Verticale/Horizontale. Passage de porte, espace accessible jusqu’au service…")
DetailedCriterion.create!(handicap: h, criterion: equip, tooltip: "Sanitaire")
DetailedCriterion.create!(handicap: h, criterion: access, tooltip: "Délocalisation de l’offre, livraison du service…")
puts "     -- Detailed Criteria generated for Handicap [#{h.name}] !"

h = Handicap.create!(name: "Marchand")
puts "     -- Generating Detailed Criteria for Handicap [#{h.name}]."
DetailedCriterion.create!(handicap: h, criterion: ext, tooltip: "Visibilité, ramp, vilisibilité de l’enseigne, praticabilité du cheminement…")
DetailedCriterion.create!(handicap: h, criterion: entry, tooltip: "Porte, rampe, main courante…")
DetailedCriterion.create!(handicap: h, criterion: movement, tooltip: "Verticale/Horizontale. Passage de porte, espace accessible jusqu’au service…")
DetailedCriterion.create!(handicap: h, criterion: equip, tooltip: "Sanitaire")
DetailedCriterion.create!(handicap: h, criterion: access, tooltip: "Délocalisation de l’offre, livraison du service…")
puts "     -- Detailed Criteria generated for Handicap [#{h.name}] !"

#### SIGHT

h = Handicap.create!(name: "Aveugle")
puts "     -- Generating Detailed Criteria for Handicap [#{h.name}]."
DetailedCriterion.create!(handicap: h, criterion: ext, tooltip: "Bandes podotactiles, cheminement, environnement immédiat sécurisé…")
DetailedCriterion.create!(handicap: h, criterion: entry, tooltip: "Porte, main courante, indication et information sonore, porte, braille, bandes podotactiles…")
DetailedCriterion.create!(handicap: h, criterion: movement, tooltip: "Horizontale: Bande podotactiles, mains courantes. Verticale: Ascenseur. (retransmission vocales des informations + brailles)…")
DetailedCriterion.create!(handicap: h, criterion: avail, tooltip: "Sensibilisation du personnel.")
DetailedCriterion.create!(handicap: h, criterion: access, tooltip: "Délocalisation de l’offre, délivrance du service, accès aux animaux,  accompagnement du personnel, écriture en brail…")
puts "     -- Detailed Criteria generated for Handicap [#{h.name}] !"

h = Handicap.create!(name: "Malvoyant")
puts "     -- Generating Detailed Criteria for Handicap [#{h.name}]."
DetailedCriterion.create!(handicap: h, criterion: ext, tooltip: "Lisibilité et visibilité de l’enseigne, lisibilité et visibilité des panneaux de signalisation, cheminement, environnement immédiat sécurisé…")
DetailedCriterion.create!(handicap: h, criterion: entry, tooltip: "Visibilité et visibilité des panneaux de signalisation, porte, luminosité, présence sonore,  braille, bandes podotactiles…")
DetailedCriterion.create!(handicap: h, criterion: movement, tooltip: "Horizontale: Contraste de couleurs, visibilité et lisibilité des panneaux de signalisation, Bande podotactiles, qualité de l’éclairage. Verticale: Ascenseur. (retransmission vocales des informations + brailles)…")
DetailedCriterion.create!(handicap: h, criterion: avail, tooltip: "Sensibilisation du personnel.")
DetailedCriterion.create!(handicap: h, criterion: access, tooltip: "Délocalisation de l’offre, délivrance du service, accompagnement du personnel, écriture en brail…")
puts "     -- Detailed Criteria generated for Handicap [#{h.name}] !"

#### HEARING

h = Handicap.create!(name: "Malentendant")
puts "     -- Generating Detailed Criteria for Handicap [#{h.name}]."
DetailedCriterion.create!(handicap: h, criterion: ext, tooltip: "Cheminement, parking, environnement immédiat sécurisé…")
DetailedCriterion.create!(handicap: h, criterion: entry, tooltip: "sonnette (signaux visuels de présence),  boucle magnétique…")
DetailedCriterion.create!(handicap: h, criterion: movement, tooltip: "Verticale/Horizontale. Boucle magnétique, retransmission visuelle de l’information, insonorisation…")
DetailedCriterion.create!(handicap: h, criterion: avail, tooltip: "Sensibilisation du personnel.")
DetailedCriterion.create!(handicap: h, criterion: access, tooltip: "Délocalisation de l’offre,  délivrance du service, accompagnement du personnel...")
puts "     -- Detailed Criteria generated for Handicap [#{h.name}] !"

h = Handicap.create!(name: "Sourd")
puts "     -- Generating Detailed Criteria for Handicap [#{h.name}]."
DetailedCriterion.create!(handicap: h, criterion: ext, tooltip: "Cheminement, parking, route traversée,environnement immédiat sécurisé...")
DetailedCriterion.create!(handicap: h, criterion: entry, tooltip: "sonnette (signaux visuels de présence)…")
DetailedCriterion.create!(handicap: h, criterion: movement, tooltip: "Verticale/Horizontale. Retransmission visuelle de l’information…")
DetailedCriterion.create!(handicap: h, criterion: avail, tooltip: "Sensibilisation du personnel.")
DetailedCriterion.create!(handicap: h, criterion: access, tooltip: "Délivrance du service, accompagnement du personnel…")
puts "     -- Detailed Criteria generated for Handicap [#{h.name}] !"

#### MENTAL

h = Handicap.create!(name: "Handicap mental")
puts "     -- Generating Detailed Criteria for Handicap [#{h.name}]."
DetailedCriterion.create!(handicap: h, criterion: ext, tooltip: "Cheminement, lisibilité de l’enseigne, lisibilité et visibilité des panneaux de signalisation, environnement immédiat sécurisé…")
DetailedCriterion.create!(handicap: h, criterion: entry, tooltip: "Accès simple et bien identifié…")
DetailedCriterion.create!(handicap: h, criterion: movement, tooltip: "Verticale/Horizontale. Pictogramme, informations simplifiées, contraste…")
DetailedCriterion.create!(handicap: h, criterion: avail, tooltip: "Sensibilisation du personnel.")
DetailedCriterion.create!(handicap: h, criterion: access, tooltip: "Délocalisation de l’offre,  pictogramme, simplicilité d’utilisation, information simplifiée…)")
puts "     -- Detailed Criteria generated for Handicap [#{h.name}] !"

puts "  -- Handicaps generated !"


#############   SEED WITH THE DATA FROM THE LABEL TOURISME-HANDICAP CSV-EXTRACTION OF THEIR DB   ############
puts "  -- Importing data from the Label Tourisme-Handicap DB."

url = "http://static.data.gouv.fr/89/8598e55c0896b609dfdc4d780e0b499ca970e81df08aab44a32edca7d2dc26.csv"

puts "    -- Retrieving CSV extraction from source..."
content = open(url).read.tr("\r\"", "")                        # Removing useless chars
puts "    -- Retrieved ! Parsing..."
content = content.force_encoding("ISO-8859-1").encode("UTF-8") # Encoding issues
content = content.split("\n")                                  # Getting rows

titles = content[0].split("\t")                                # Getting first row cols (titles)
puts "      -- Column titles extracted !"

#############   EXAMPLE OF THE CONTENT IN THE CSV   ############
# [
#   "MARQUE" :          "Tourisme et Handicap",
#   "CATEGORIE" :       "Meublé de tourisme",
#   "STRUCTURE" :       "Meublé de tourisme",
#   "ETABLISSEMENT" :   "Gîte Ferme de Montépin",
#   "HANDICAPS" :       "auditif ; visuel ; moteur ; mental",
#   "SITEWEB" :         http://www.gites-de-France-ain.com",
#   "TELEPHONE" :       "385305484",
#   "FAX" :             "",
#   "LABEL" :           "Gîtes de France",
#   "REGION" :          "Rhône-Alpes",
#   "DEPARTEMENT" :     "AIN",
#   "VILLE" :           "BAGÉ LA VILLE",
#   "CODE POSTAL":" :   "1380",
#   "ADRESSE" :         "1790 route de Montépin",
#   "ADRESSEADMIN" :    "",
#   "CONTACT" :         "Mme Storrer",
#   "EMAILCONTACT" :    "montepin@wanadoo.fr"
# ]

raw_data = content[1..-1]

# Filtering columns (not needed here)
# raw_data.select! { |e| e.split("\t", -1)[titles.index("")] == "" }

# Creation from filtered data.
puts "      -- Creating Places from data..."
raw_data.each_with_index do |p, index|
  place = p.split("\t", -1)
  address = place[titles.index("ADRESSE")]
  postcode = place[titles.index("CODE POSTAL")]
  city = place[titles.index("VILLE")]
  Place.find_or_initialize_by(name: place[titles.index("ETABLISSEMENT")])
    .update_attributes!(
      certification: "Label Tourisme-Handicap",
      address: "#{address} #{postcode} #{city}"
    )

  # Counter of the % of completion
  if true # while dev'ing stopping at 10 places for test (API limitations)
    print "\r         [ #{(index*100)/10}% ]" #raw_data.length}% ]"
    break if index == 10
  else
    print "\r         [ #{(index*100)/raw_data.length}% ]"
  end
end
puts "\n"
puts "      -- Created Places !"
puts "    -- Parsed data successfully !"
puts "  -- Import completed !"

# Success !
puts "Seed completed without errors !"
