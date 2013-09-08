include_recipe 'ruby'
package 'make'

execute 'install-sass' do
    user node[:sass][:user]
    command 'gem install sass'
end

execute 'install-rb-inotify' do
    user node[:sass][:user]
    command "gem install --version '~> 0.9' rb-inotify"
end

directory node[:sass][:lib] do
    not_if {File.exists?(node[:sass][:lib])}
    owner node[:sass][:user]
    group node[:sass][:group]
    action :create
end

directory "#{node[:sass][:lib]}/sass" do
    not_if {File.exists?("#{node[:sass][:lib]}/sass")}
    owner node[:sass][:user]
    group node[:sass][:group]
    action :create
end

cookbook_file "#{node[:sass][:lib]}/sass/test.scss" do
    not_if {File.exists?("#{node[:sass][:lib]}/sass/test.scss")}
    owner node[:sass][:user]
    group node[:sass][:group]
end

#execute "Start SASS conversion" do
#    command "nohup sass --watch #{node[:sass][:lib]/sass}:#{node[:sass][:lib]} &"
#end
