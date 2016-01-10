file_types=["doc","pdf","mp3","txt","mp4","cpp","in","out"]
i=0
rnd=Random.new
file_types.each do |type|
  rnd.rand(5..15).times do
    f=File.new("test_file#{i}."+"#{type}","w")
    f.close
    i=i+1
  end
end
