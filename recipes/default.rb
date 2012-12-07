lib="lib"
sassPath="#{lib}/sass"

include_recipe 'ruby'

require 'fileutils'

execute 'install--sass' do
    command 'gem install sass'
end

unless FileUtils.exists?(lib)
    FileUtils.mkdir(lib)
    #Dir.mkdir(lib)
    puts "Created #{lib}"
end

unless FileUtils.exists?(sassPath)
    FileUtils.mkdir(sassPath)
    puts "Created #{sassPath}"
end

execute 'start-sass-watch' do
    command "sass --watch #{sassPath}:#{lib}" 
end