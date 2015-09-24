require "yaml"

path = "./link/gitswitch"

gitswitch = YAML.load(open(path))
File.write path, YAML.dump(gitswitch)
