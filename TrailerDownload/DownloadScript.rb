##parse file names and output clean text for youtube search

folder_list = Dir['/Users/teaguecarvalho/Desktop/MovieStructure/*']
parsed_list = []

# folder_name = "/Fantastic.Mr.Fox.720p.BluRay.x264-ALLiANCE"
folder_list.each do |folder_name|
	parsed_name = folder_name.gsub("720", "").gsub("1080", "").gsub("mov", "").gsub("mkv", "")
	parsed_name = parsed_name.slice(parsed_name.rindex("/")+1..-1).gsub(/[()\[\]]/,"").gsub(/[\._]/, " ").strip
	parsed_name = parsed_name.slice(0..parsed_name.index(" p ")) if parsed_name.include? " p "

	if parsed_name.include? "20"
		parsed_name =  parsed_name.slice(0..(parsed_name.index('20')-1)).strip
	end
	if parsed_name.include? "19"
		parsed_name =  parsed_name.slice(0..(parsed_name.index('19')-1)).strip
	end

	parsed_list << parsed_name
end

parsed_list.each_with_index do |name, index|
	puts parsed_list[index]
	puts folder_list[index]
end