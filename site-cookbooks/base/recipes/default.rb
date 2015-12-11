#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# 適当にパッケージを入れてみる
%w{zsh ImageMagick wget httpd httpd-devel php php-pear}.each do |pkg|
    package pkg do
        action :install
    end
end

bash "hoge" do
      code "sudo pecl install imagick"
end
