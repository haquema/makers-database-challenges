require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'

DatabaseConnection.connect('music_library')

# sql = 'SELECT id, title FROM albums;'
# result = DatabaseConnection.exec_params(sql, [])

# result.each do |record|
#   p record
# end

artist_repository = ArtistRepository.new

artist_repository.all.each do |artist|
  p artist
end