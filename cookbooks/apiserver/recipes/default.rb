#
# Cookbook Name:: apiserver
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'java::default'
include_recipe 'apiserver::api'

