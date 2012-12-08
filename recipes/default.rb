lib="/vagrant/lib"
sassPath="#{lib}/sass"

include_recipe 'ruby'

execute 'install-sass' do
    command 'gem install sass'
end

execute 'install-foreman' do
    command 'gem install foreman'
end

execute "mkdir-lib" do
    not_if {File.exists?(lib)}
    command "mkdir #{lib}"
end

execute "mkdir-sass" do
    not_if {File.exists?(sassPath)}
    command "mkdir #{sassPath}"
end

execute "create-procfile" do
    command "nohup sass --watch #{sassPath}:#{lib} &"
end

# execute "start-foreman" do
#     command "foreman start -f /home/vagrant/Procfile &"
# end

# execute "create-sass-service" do
#     command "echo 'sass --watch #{sassPath}:#{lib}'" >> "~/sass.sh"
# end

# execute 'start-sass-watch' do
#     command "chmod a+x ~/sass.sh && ~/sass.sh &"
# end