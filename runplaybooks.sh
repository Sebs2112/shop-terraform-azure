#!/bin/bash

# NGINX
ansible-playbook \
	-v -i "$(terraform output frontend_fqdn), " \
    -u sebflower \
    --ssh-common-args="-o StrictHostKeyChecking=no" playbook.yml
