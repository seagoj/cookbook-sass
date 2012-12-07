lib="/vagrant/lib"
sassPath="#{lib}/sass"

include_recipe 'ruby'

execute 'install--sass' do
    command 'gem install sass'
end

unless (Dir.exists?(lib))
    Dir.mkdir(lib)

execute 'start sass watch' do
    command "sass --watch #{sassPath}:#{lib}" 
end