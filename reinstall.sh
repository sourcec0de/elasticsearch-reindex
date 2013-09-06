# Modified For OSX 10.8.4 with ES installed with
# brew install elasticsearch
ES=/usr/local/Cellar/elasticsearch/0.90.3
sudo $ES/bin/plugin remove reindex
mvn -DskipTests clean package
FILE=`ls ./target/elasticsearch-*zip`
sudo $ES/bin/plugin -url file:$FILE -install reindex
launchctl stop homebrew.mxcl.elasticsearch
launchctl start homebrew.mxcl.elasticsearch
