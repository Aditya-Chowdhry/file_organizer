#Get the current directory object
present_dir=Dir.pwd
dir=Dir.new(present_dir)

#Dir.mkdir(File.join(Dir.home, "aaaaaa"))

dir.each do |file|
  if File.extname(file)==".rb"
    puts "#{file}"
  end
end
