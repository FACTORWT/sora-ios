require 'spaceship'

key_id  = ENV['ASC_KEY_ID']
issuer  = ENV['ASC_ISSUER_ID']
path    = File.expand_path("~/private_keys/AuthKey_#{key_id}.p8")
team    = "D695835P4T"

token = Spaceship::ConnectAPI::Token.create(key_id: key_id, issuer_id: issuer, filepath: path)
Spaceship::Portal.login(token)
Spaceship::Portal.client.team_id = team

certs = Spaceship::Portal::Certificate.all
puts "TOTAL: #{certs.size}"
certs.each do |c|
  puts "#{c.id}\t#{c.name}\t#{c.expires}\t#{c.class.name.split('::').last}"
end
