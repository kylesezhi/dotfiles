
# Setting PATH for Python 3.9
# The original version is saved in .zprofile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH

# Setting up variables for WSI Team Keele
export M2_HOME=/usr/local/opt/maven@3.5/
export M2=$M2_HOME/bin
export MAVEN_OPTS="-Xmx4096m -Xms512m -Dorg.apache.maven.user-settings=/Users/"$USER"/.m2/settings.xml -Djava.net.preferIPv4Addresses=true"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home
export PATH="$M2:$PATH" PATH="$JAVA_HOME/bin:$PATH" PATH=$PATH:~/temp

# z - jump around
. /Users/kbedell/Documents/dev/z/z.sh

# ~/bin from developer-tools WSI Keele
export PATH="/Users/kbedell/bin:$PATH"

# Start keele
alias keel="python3 /Users/kbedell/Library/Application\ Support/iTerm2/Scripts/start-keele.py"

# Reference:
# https://nexient.atlassian.net/wiki/spaces/WSM/pages/2105344100/MFE+Vue+Tips+tricks+and+best+practices#Working-with-Sass-in-MFE

export MFE=~/work/git/aw
export WSI_TEAM="Keele"
export WSI_TEAM_MFE_REPOS=(
  "ecom-stack-localdev"
  "ecom-delivery-mfe-config"
  "ecom-app-shop"
  "ecom-app-global"
  "ecom-app-config-mg"
  "ecom-app-config-pb"
  "ecom-app-config-pk"
  "ecom-app-config-pt"
  "ecom-app-config-we"
  "ecom-app-config-ws"
  "ecom-app-config-dev"
  )
export WSI_BEDROCK_MFE_REPOS=(
  "ecom-app-config-all"
  "ecom-svc-app-delivery"
  "ecom-app-registry"
  "ecom-app-customer"
)
# functions
gitclonemfe() {
  mkdir -p ~/work/git/aw
  foreach repo ($WSI_TEAM_MFE_REPOS) {
    cd ~/work/git/aw
    git clone git@github.wsgc.com:eCommerce-${WSI_TEAM}/${repo}.git
    cd ${repo}
    git remote add upstream git@github.wsgc.com:eCommerce-Bedrock/${repo}.git
  }
  foreach repo ($WSI_BEDROCK_MFE_REPOS) {
    cd ~/work/git/aw
    git clone git@github.wsgc.com:eCommerce-Bedrock/${repo}.git
  }
  echo "\033[0;32m                                     DONE\033[0m\n"
}

setupmfe(){
  cd ${MFE}/ecom-delivery-mfe-config/local/delivery/config
  sed -e s/localhost/host.docker.internal/g application.SAMPLE.properties > application.properties
  ./../scripts/build-config.sh
  cd ${MFE}/ecom-svc-app-delivery
  mvn -Dmaven.javadoc.skip -Dmaven.test.skip clean install
  cd ${MFE}/ecom-svc-app-delivery/delivery-etcd
  ./scripts/setup-auth.sh
  cd ${MFE}/ecom-svc-app-delivery/config-tool
  cp sync-config-SAMPLE.properties sync-config.properties
  ./runtool syncschedules --mode=replace
  sed -i -e s+1.0/global+1.7.15/localdev+ ${MFE}/ecom-delivery-mfe-config/local/delivery/simple-config/live/endpoints.json
  sed -i -e s+1.0/shop+1.11.20/localdev+ ${MFE}/ecom-delivery-mfe-config/local/delivery/simple-config/live/endpoints.json
  cd ${MFE}/ecom-app-global && npm i & \
  cd ${MFE}/ecom-app-shop && npm i & \
  cd ${MFE}/ecom-app-registry && npm i & \
  cd ${MFE}/ecom-app-customer && npm i & \
  cd ${MFE}/ecom-app-config-all && npm i
  ${MFE}/mfe-scripts/updateEverythingAllBrands.sh
  nexient
  echo "\033[0;32m                                     DONE\033[0m\n"
}

gitfetchall(){
  for repo in ecom-app-config-all ecom-app-config-mg ecom-app-config-pb ecom-app-config-pk ecom-app-config-pt ecom-app-config-we ecom-app-config-ws ecom-app-global ecom-app-config-dev ecom-app-shop ecom-app-customer ecom-app-registry ecom-app-checkout; do
      echo "\033[0;36m\n----------------- ${repo} -----------------\033[0m"
      cd ~/work/git/aw/${repo}
      git fetch --all
  done
  cd ~/work/git/aw/
}
