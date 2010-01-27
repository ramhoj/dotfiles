require 'rake'

desc "Install dot files in home directory"
task :install do
  script_path = File.expand_path('./scripts/link_dotfiles.sh', File.dirname(__FILE__))
  `#{script_path}`
end

desc "Set up RVM"
task :rvm => ["rvm:setup"]

namespace :rvm do
  task :install do
    system %Q{rvm-install}
  end
  
  task :setup => [:install] do
    system %Q{./scripts/install_rvm.sh}
  end
end

namespace :mongodb do
  desc "Setup mongo:db as a launchd service so it starts on system start"
  task :setup do
    system %Q{sudo ./scripts/launchmongo.sh}
  end
end
