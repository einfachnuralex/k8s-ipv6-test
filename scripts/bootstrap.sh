#!/bin/bash
#
# Copyright 2012 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e

echo "Installing Ansible..."
apt-get update -y
apt-get install -y curl apt-transport-https

echo 'deb https://apt.kubernetes.io/ kubernetes-xenial main' | tee /etc/apt/sources.list.d/kubernetes.list
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update
apt-get install -y kubelet=1.18.2-00 kubeadm=1.18.2-00 kubectl=1.18.2-00
apt-mark hold kubelet kubeadm kubectl
apt-get install -y docker.io
apt-mark hold docker.io
systemctl enable docker
systemctl restart docker