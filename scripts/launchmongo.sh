#!/bin/bash
# run with: curl -s http://gist.github.com/265272.txt | bash
set -e
 
mongodir=/var/mongodb
datadir=$mongodir/data
conf=$mongodir/mongod.conf
agent=/Library/LaunchAgents/org.mongodb.mongod.plist

mongod=$(which mongod)
 
mkdir -p $datadir
 
# daemon configuration
echo "dbpath = $datadir
# Only accept local connections
bind_ip = 127.0.0.1" > $conf
 
# write launchd agent
echo "<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE plist PUBLIC '-//Apple//DTD PLIST 1.0//EN' 'http://www.apple.com/DTDs/PropertyList-1.0.dtd'>
<plist version='1.0'>
<dict>
<key>Label</key>
<string>org.mongodb.mongod</string>
<key>ProgramArguments</key>
<array>
<string>$mongod</string>
<string>run</string>
<string>--config</string>
<string>$conf</string>
</array>
<key>RunAtLoad</key>
<true/>
<key>KeepAlive</key>
<true/>
<key>WorkingDirectory</key>
<string>$mongodir</string>
<key>StandardErrorPath</key>
<string>$mongodir/error.log</string>
<key>StandardOutPath</key>
<string>$mongodir/mongo.log</string>
</dict>
</plist>" > $agent
 
launchctl load $agent
 
echo "MongoDB should now be running - check its status at http://localhost:28017/"