#
# Cookbook Name:: yum_repo
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'add_epel' do
  user 'root'
  code <<-EOC
    rpm -ivh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
    sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/epel.repo
  EOC
  creates "/etc/yum.repos.d/epel.repo"
end

bash 'add_rpmforge' do
  user 'root'
  code <<-EOC
    rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
    sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/rpmforge.repo
  EOC
  creates "/etc/yum.repos.d/rpmforge.repo"
end

bash 'add_remi' do
  user 'root'
  code <<-EOC
    rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
    sed -i -e "s/enabled *= *1/enabled=0/g" /etc/yum.repos.d/remi.repo
  EOC
  creates "/etc/yum.repos.d/remi.repo"
end

cookbook_file '/etc/yum.repos.d/CentOS-Base.repo' do
    source 'CentOS-Base.repo'
    owner  'root'
    group  'root'
    mode   '0644'
    action :create
end
