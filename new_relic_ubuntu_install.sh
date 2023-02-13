echo "license-info | sudo tee -a /etc/newrelic-infra.yml

cat /etc/lsb-release
curl -s https://download.newrelic.com/infrastructure_agent/gpg/newrelic-infra.gpg | sudo apt-key add -

4. Ubuntu 16.04
printf "deb https://download.newrelic.com/infrastructure_agent/linux/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list

Ubuntu 18.04
printf "deb https://download.newrelic.com/infrastructure_agent/linux/apt bionic main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list

Ubuntu 20.04
`printf "deb https://download.newrelic.com/infrastructure_agent/linux/apt focal main" | sudo tee -a /etc/apt/sources.list.d/newrelic-infra.list`

sudo apt-get update
sudo apt-get install newrelic-infra -y
