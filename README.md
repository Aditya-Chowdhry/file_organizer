# file_organizer
A basic hack to organize files in a folder. Categorizes different files in corresponding folders.
Currently very basic utility.
Working: https://media.giphy.com/media/3oxRmCVhc6d9P8atZS/giphy.gif  

How to run:
Add the path of the directory(file_organizer) to PATH variable in linux.  
Change the directory to one which you want to organize
Then do  <b>ruby file_organizer.rb</b>  to run  
Or to make it executable do <b>chmod +x file_organizer.rb</b>  
Then you can run as <b>./file_organizer.rb</b>

Follow this to make it a executable script: http://commandercoriander.net/blog/2013/02/16/making-a-ruby-script-executable/  
Then you can simple run with typing <b>file_organizer</b>  

Choose the option and see the results.
Two options:  
1. Press 1: Manually enter file extensions  
  eg: <b>pdf,doc,mp3</b>  
   The list should be comma seperated.  
2. Press 2: Organize everything.  

Requirements:  
<b>Ruby 2.1</b>  

To do:  
1. Command line interface  
2. Addition of more type of files  
3. Currently not handling any exceptions.
