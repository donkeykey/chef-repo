#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#
remote_file "#{Chef::Config[:file_cache_path]}/jasper-libs-1.900.1-26.el7_0.3.x86_64.rpm" do
    source "ftp://rpmfind.net/linux/centos/7.1.1503/os/x86_64/Packages/jasper-libs-1.900.1-26.el7_0.3.x86_64.rpm"
    not_if "rpm -qa | grep -q '^jasper-libs-1.900.1-26.el7_0.3'"
    action :create
    notifies :install, "rpm_package[jasper-libs]", :immediately
end

rpm_package "jasper-libs" do
    source "#{Chef::Config[:file_cache_path]}/jasper-libs-1.900.1-26.el7_0.3.x86_64.rpm"
    action :install
end

%w{gcc zsh vim git ghostscript ImageMagick wget httpd httpd-devel php php-pear php-devel}.each do |pkg|
    package pkg do
        action :install
        options "--enablerepo=remi,base,epel,rpmforge,base"
    end
end

%w{re2c}.each do |pkg|
    package pkg do
        action :install
        options "--enablerepo=rpmforge"
    end
end

%w{ImageMagick-devel}.each do |pkg|
    package pkg do
        action :install
        options "--enablerepo=remi,base,epel,rpmforge,base"
    end
end

execute "install imagick" do
    not_if "pecl list imagick"
    command "pecl install imagick"
    action :run
end
