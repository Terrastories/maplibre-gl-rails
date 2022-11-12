#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rake/testtask'
require File.expand_path('../lib/maplibre-gl/updater', __FILE__)

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc 'Update MapLibre GL JS assets and plugins'
task 'update-maplibre' do
  Updater.new.update
end

task update: 'update-maplibre'

task default: :test
