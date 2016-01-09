#Get the current directory object
present_dir=Dir.pwd
dir=Dir.new(present_dir)
puts "Enter file extensions you need to organize(seperated by a comma eg. \"doc,pdf,mp3\"):"
input=gets.chomp()
file_types=input.split(",")
puts file_types
file_types.each do |type|
  if Dir.exist?(type)
     Dir.mkdir("#{type.upcase} files")
  end
end

hash_files=Hash.new

dir.each do |file|
  ext_name=File.extname(file)
  if hash_files.has_key?(ext_name)
    hash_files[ext_name]=hash_files[ext_name]+1
  else
    hash_files[ext_name]=1
  end
end

file_types.each do |type|
  puts "#{type} count: #{hash_files["."+type]}"
end
