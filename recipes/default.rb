lib="/vagrant/lib"
sassPath="#{lib}/sass"

include_recipe 'ruby'

execute 'install--sass' do
    command 'ruby install sass'
end

execute 'start sass watch' do
    command "sass --watch #{sassPath}:#{lib}" 
end