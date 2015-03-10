#
# Cookbook Name:: es
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "build-essential"
include_recipe "python::default"
include_recipe "gunicorn::default"                                                                                                                                                                          
include_recipe "elasticsearch::default"

%w{emacs git-core rlwrap openjdk-6-jdk tmux curl tree unzip nginx python-setuptools python-dev build-essential supervisor}.each do |pkg|
  package pkg do
    action :install
  end
end
 
service "nginx" do
  enabled true
  running true
  supports :status => true, :restart => true, :reload => true
  action [:start, :enable]
end
 
python_virtualenv "/home/vagrant/elasticEnv" do
  interpreter "python2.7"
  owner "vagrant"
  group "vagrant"
  action :create
end

