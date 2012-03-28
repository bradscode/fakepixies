namespace :demo  do
  desc "Import data from a json file"
  task :populate => :environment do
    puts "reading file.."
    data=File.read("#{Rails.root}/db/data/everything.json")
    puts "parsing json.."
    jo=JSON.parse(data)
    
    puts "creating objects.."
    
    jo['genres'].each do |g|
      genre=Genre.create(:name=>g['name'])
      g['artists'].each do |art|
        artist=Artist.create(:name=>art['name'])
        genre.artists<<artist

        art['albums'].each do |alb|
          artist.albums<<Album.create(:name=> alb['name'])
        end
      end
    end
    
    puts "Done! I think it even worked!"
  end
end