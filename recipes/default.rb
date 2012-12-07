lib="lib"
sassPath="#{lib}/sass"

include_recipe 'ruby'

execute 'install--sass' do
    command 'gem install sass'
end

puts Dir.pwd

unless File.exists?(lib)
    Dir.mkdir(lib)
    puts "Created #{lib}"
end

unless File.exists?(sassPath)
    Dir.chdir(lib)
    Dir.mkdir('sass')
    puts "Created #{sassPath}"
end

execute 'start-sass-watch' do
    command "sass --watch #{sassPath}:#{lib}" 
end