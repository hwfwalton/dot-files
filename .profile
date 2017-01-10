alias ls='ls -G'
alias rm='rm -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias MailFoo='cd ~/Code/MailFoo'
alias MailFooTest='cd ~/Code/MailFooTest'

alias gc='gcloud compute'
alias chrome='open -a "Google Chrome"'
alias brb='tput bel'

runDev() {
  # Run stunnel at startup so the dev server works
  cd ~/stunnel && stunnel ./stunnel.conf
  cd ~/Code/MailFoo

  ~/Code/MailFoo/Server-ear/run.sh -t -d ~/Code/MailFooDataStores
}

runTesting() {
  # Run stunnel at startup so the dev server works
  cd ~/stunnel && stunnel ./stunnel.conf
  cd ~/Code/MailFoo

  ~/Code/MailFoo/Server-ear/run.sh -t -d /tmp/mailfootestdir
}

updateLocale() {
  STARTING_DIR="$(pwd)"
  cd ~/Code/MailFoo
  rsync -a --delete --exclude="WEB-INF/" "./ServerCore-war/src/main/webapp/" "./Server-ear/target/Server-ear-1/ServerCore-war-1.war/"
  rsync -a --delete --exclude="WEB-INF/" "./ServerStatic-war/src/main/webapp/" "./Server-ear/target/Server-ear-1/ServerStatic-war-1.war/"
  cd $STARTING_DIR
}

copyTestData() {
  pushd ~/Code/MailFoo/IntegrationTests
  mvn exec:java -Dexec.mainClass=com.rewardly.integrationtests.util.TestDatastoreGetter -Dexec.classpathScope=test -Dexec.args=$1
  popd
}

runTest() {
  pushd ~/Code/MailFoo/IntegrationTests
  mvn -B test -Dtest=$1 -DExtensionDir=../extensions/devBuilds/chrome -Dwebdriver.chrome.driver=/Users/hwfwalton/libs/chromedriver
  popd
}

alias fix_audio='sudo killall coreaudiod'
alias fix_dock='sudo killall Dock'
alias fix_npm='cd ~/Code/MailFoo; rm -rf node_modules && npm install'

alias screencap='screencapture -i -T 5 -C ~/Desktop/screencap.png'

# export DOCKER_HOST=tcp://192.168.59.103:2376
# export DOCKER_CERT_PATH=/Users/hwfwalton/.boot2docker/certs/boot2docker-vm
# export DOCKER_TLS_VERIFY=1

source ~/.githubToken
export DEFAULT_ENCODING=UTF-8
export _JAVA_OPTIONS='-XX:MaxPermSize=512m -Xmx1024m'
export DBG_ENABLE=true

# Automatically open MailFoo upon opening a new terminal session
cd ~/Code/MailFoo

export GOPATH=~/go
export GOBIN=~/go/bin

alias config='/usr/bin/git --git-dir=/Users/hwfwalton/.cfg/ --work-tree=/Users/hwfwalton'
