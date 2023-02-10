## installation instructions (on windows)
make sure you have latest versions of vagrant and virtualbox installed.
run `./install.ps1` with powershell.
see result in any of the following links: 
* http://10.1.0.10:30036/
* http://10.1.0.11:30036/
* http://10.1.0.12:30036/

## Documentation
Starting with no knowledge on either Vagrant or Helm, and very little on k8s, this was definitely a challenge.
This is how I got it done:
1. build and push the container from the app folder into `eladlevy14/mission:latest` on docker hub.
1. the Vagrantfile and node configuration scripts were based on https://github.com/techiescamp/vagrant-kubeadm-kubernetes . The Vagrantfile configures a cluster with 3 nodes, configures one as master and two as workers which register themselves to the master.
1. the bootstrap script installs helm on the master node and uses it to install the ingress controller, and then apply the service and deployment.
1. The service then exposes the application through nodeports.

## What would I have done if I had more time?
1. ci/cd, of course. I think a proper github action would have done nicely here.
1. Change the container registry to a private one (like ECR). The docker hub pull limit is really annoying.
1. change the service type to a load balancer, exposing a single IP address. I tried configuring such an ingress based on the controller installed with helm, but got stuck trying to configure it correctly.