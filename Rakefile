require 'rake'

desc "Install dot files in home directory"
task :install do
  replace_all = false
  Dir['*'].each do |file|
    next if %w[Rakefile README LICENSE install_rvm.sh rvm].include? file
    
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

desc "Set up RVM"
task :rvm => ["rvm:setup"]

namespace :rvm do
  task :install do
    system %Q{rvm-install}
  end
  
  task :setup => [:install] do
    system %Q{./install_rvm.sh}
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
