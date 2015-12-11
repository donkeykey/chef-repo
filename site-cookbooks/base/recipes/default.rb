#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# 適当にパッケージを入れてみる
%w{zsh ImageMagick}.each do |pkg|
    package pkg do
        action :install
    end
end
