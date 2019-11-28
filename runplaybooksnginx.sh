#!/bin/bash

# NGINX
ansible-playbook \
    -v -i "$(terraform output managment_fqdn)," \
    -u sebflower \
    --ssh-common-args="-o StrictHostKeyChecking=no" nginxplaybook.yml
~                                                                 
