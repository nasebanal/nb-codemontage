# CodeMontage

[Component]
* which 2.19
* tar 1.23
* openssh-server 5.3
* rvm 1.26.9
* ruby 2.1.3


[Prerequisite]
* Install Docker

[How to Use]
Step.1) Download docker image for centos 6.6.

	$ sudo docker pull centos:6.6

 (reference)
 https://registry.hub.docker.com/_/centos/

Step.2) Download Dockerfile and Chef recipe.

Step.3) Create docker image.

	$ sudo docker build -t \<Docker Image Nam\> .

Step.4) Launch docker image.

	$ sudo docker run -it --name \<Docker Container Name\> \<Docker Image Name\> /bin/bash

Step.5) Start services.

	# cd /var/chef-repo
	# chef-solo -c solo.js -j nodes/start.js

(If you want to restart services, execute the following command.)

	# chef-solo -c solo.js -j nodes/restart.js

(If you want to stop services, execute the following command.)

	# chef-solo -c solo.js -j nodes/stop.js
