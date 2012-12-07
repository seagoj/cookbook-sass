lib="/vagrant/lib"
sassPath="#{lib}/sass"

include_recipe 'ruby'

execute 'install--sass' do
    command 'gem install sass'
end

execute "mkdir-lib" do
    not_if {File.exists?(lib)}
    command "mkdir #{lib}"
end

execute "mkdir-sass" do
    not_if {File.exists?(sassPath)}
    command "mkdir #{sassPath}"
end

execute 'start-sass-watch' do
    command "sass --watch #{sassPath}:#{lib} &" 
end