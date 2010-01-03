require 'rake'

task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE].include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end

desc "Create Projects structure"
task :setup => :install do
  puts "Creating ~/Projects directory"
  system %Q{mkdir -p ~/Projects}
  
  puts "Run `source ~/.bash_profile` to apply new settings"
end

desc "Set up RVM"
task :rvm => ["rvm:set_default"]

namespace :rvm do
  task :set_default => ["187:setup", "191:setup"] do
    puts "Making ruby 1.8.7 default"
    system %Q{rvm 1.8.7 --default}
  end
  
  namespace "187" do
    task :install do
      system %Q{rvm install 1.8.7}
    end
    
    desc "Install 1.8.7 and default gems"
    task :setup => [:install] do
      system %Q{rvm 1.8.7; rvm gems load rvm/default.gems}
    end
  end
  
  namespace "191" do
    task :install do
      system %Q{rvm install 1.9.1}
    end

    desc "Install 1.9.1 and default gems"    
    task :setup => [:install] do
      system %Q{rvm 1.9.1; rvm gems load rvm/default.gems}
    end
  end
end

def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  if %w[gitconfig].include? file
    copy_file(file)
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end

def copy_file(file)
  puts "copying ~/.#{file}, make your changes there"
  system %Q{cp -r "$PWD/#{file}" "$HOME/.#{file}"}
end
