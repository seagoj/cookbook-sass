lib="/vagrant/lib"
sassPath="#{lib}/sass"

include_recipe 'ruby'

execute 'install--sass' do
    command 'gem install sass'
end

unless (File.exists?(lib))
    Dir.mkdir(lib)
end

execute 'start sass watch' do
    command "sass --watch #{sassPath}:#{lib}" 
end