#!/usr/bin/ruby
require 'fileutils'


#You can add more file types. If you have not mentioned a certain file type, a new folder will be created for it.
docs=["DOC","DOCX","PPT","PPTX","PAGES","PDF","ODT","ODP","XLSX","XLS","ODS","TXT","IN","OUT"]
images=["JPG","JPEG","GIF","PNG","SVG"]
audio=["MP3","WAV","WMA","MKA","AAC","MID","RA","RAM","RM","OGG"]
video=["FLV","WMV","MOV","MP4","MPEG","3GP","MKV"]
code=["CPP","RB","PY","HTML","CSS","JS"]
sys_files=["DEB","EXE","SH","BUNDLE"]
compressed=["RAR","JAR","ZIP","TAR","MAR","ISO","LZ","7ZIP","TGZ","GZ","BZ2"]

#--------------------------------------------------methods-------------------------------------------#
def create_directories(file_types)
  hash_files=Hash.new
  file_types.each do |type|
    if !Dir.exists?("#{type.upcase} files")
      Dir.mkdir("#{type.upcase} files")
    end
    hash_files[type]=0
  end
  return hash_files
end

def organize(hash_files,selected,file_formats)   #Use of selected: If selected is true that means the option selected in beginning was 1.
                                                 #Only the user selected filetypes will be organized other wise all files will be organized

  #Analysis is used to count each type of file,directories and unknown files.
  analysis=Hash.new
  analysis["directory"]=0
  analysis["unknown"]=0

  #Get the current directory object
  present_dir=Dir.pwd
  dir=Dir.new(present_dir)

  dir.each do |file|
   if(file!="file_organizer.rb") #Do not put the file_organizer.rb in folder.

     if Dir.exist?(file) #Check whether the file is Directory

       analysis["directory"]=analysis["directory"] + 1

     elsif File.file?(file) #Whether it is a general file type or not.

       ext_name=File.extname(file)
       ext_name=ext_name.split(".")[1].to_s
       #puts "extensions: " + ext_name

       #---------------------Analysis-------------------------------#
       if analysis.has_key?(ext_name)
         analysis[ext_name]= analysis[ext_name] + 1
       else
         analysis[ext_name]=1
       end
       #---------------------------------------------------------#

       if selected

         if hash_files.has_key?(ext_name)
            hash_files[ext_name]=hash_files[ext_name]+1
            source=File.absolute_path(file)
            FileUtils.mv(present_dir+"/"+file, present_dir + "/#{ext_name.upcase} files/"+file)
          end

       else

         if file_formats.has_key?(ext_name.upcase)
            if !Dir.exists?(file_formats[ext_name.upcase])
                Dir.mkdir(file_formats[ext_name.upcase])
            end
            source=File.absolute_path(file)
            FileUtils.mv(present_dir+"/"+file, present_dir + "/#{file_formats[ext_name.upcase]}/"+file)
          else
            if !Dir.exists?("#{ext_name.upcase} files")
              Dir.mkdir("#{ext_name.upcase} files")
            end
            source=File.absolute_path(file)
            FileUtils.mv(present_dir+"/"+file, present_dir + "/#{ext_name.upcase} files/"+file)
          end

        end

      else

        analysis["unknown"]=analysis["unknown"]+1
      end
    end
  end

 return analysis

end

#--------------------------------------------------end of methods-------------------------------------------#


#----------------------------------------------Main Program--------------------------------------------------------#
puts "Hi,thanks for using file_organizer!"
puts "Press 1:  Manually enter file extensions"
puts "Press 2:  Organize everything"
i=gets.chomp().to_i
file_formats=Hash.new

#------------------------------Making a hash for different type of files---------------------------------#
#To add your own type of files, First add type and its corresponding extensions on top. Eg: audio=["MP3","WMA"]. Extension should be in capital.
#Then add a for loop here adding the extensions to the hash (file_formats)

docs.each do |x|
  file_formats[x]="DOC Files"
end

audio.each do |x|
  file_formats[x]="Audio Files"
end

video.each do |x|
  file_formats[x]="Video Files"
end

images.each do |x|
  file_formats[x]="Image Files"
end

code.each do |x|
  file_formats[x]="Code Files"
end

sys_files.each do |x|
  file_formats[x]="SYS Files"
end

compressed.each do |x|
  file_formats[x]="Compressed files"
end

#----------------------------------------------end of hash map----------------------------------------/

hash_files=Hash.new

if(i==1)
  puts "Enter file extensions you need to organize(seperated by a comma eg. \"doc,pdf,mp3\"):"
  input=gets.chomp()
  file_types=input.split(",")
  hash_files=create_directories(file_types)
  analysis=organize(hash_files,true,file_formats)
else
  puts "Just sit back and relax!"
  analysis=organize(hash_files,false,file_formats)
end

puts "Your directory contains: "
total=0
analysis.each do |key,value|
  total=total+value
  puts "#{key.upcase} files: #{value}"
end
  puts "Total files: #{total}"
#--------------------------------------------------End----------------------------------------------------#
