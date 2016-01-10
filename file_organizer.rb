require 'fileutils'

#Get the current directory object
present_dir=Dir.pwd
dir=Dir.new(present_dir)
#-------------------------------#

puts "Enter file extensions you need to organize(seperated by a comma eg. \"doc,pdf,mp3\"):"
input=gets.chomp()
file_types=input.split(",")
#puts file_types
hash_files=Hash.new

file_types.each do |type|

  if !Dir.exists?("#{type.upcase} files")
    Dir.mkdir("#{type.upcase} files")
  end

  hash_files[type]=0
end


dir.each do |file|
  ext_name=File.extname(file)
  ext_name=ext_name.split(".")[1].to_s

  puts "extensions: " + ext_name

  if hash_files.has_key?(ext_name)
    hash_files[ext_name]=hash_files[ext_name]+1
    source=File.absolute_path(file)
    FileUtils.mv(present_dir+"/"+file, present_dir + "/#{ext_name.upcase} files/"+file)
  end

end

file_types.each do |type|
  if hash_files.has_key?(type)
    puts "#{type} count: #{hash_files[type]}"
  end
end
