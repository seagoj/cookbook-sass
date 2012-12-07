lib="/vagrant/lib"
sassPath="/vagrant/lib/sass"

include_recipe 'ruby'

execute 'install--sass' do
    command 'gem install sass'
end

unless File.exists?(lib)
    Dir.mkdir(lib)
    puts "Created #{lib}"
end

unless File.exists?(sassPath)
    Dir.mkdir(sassPath)
    puts "Created #{sassPath}"
end

execute 'start-sass-watch' do
    command "sass --watch #{sassPath}:#{lib}" 
end