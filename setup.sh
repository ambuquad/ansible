#!/bin/bash
CloudImage=Rocky-9-GenericCloud-Base.latest.x86_64.qcow2

if [ -f $CloudImage ]; then
   echo "Rocky-9 Cloud image is present"
else
   echo "Going to get Rocky-9 Cloud image"
   wget https://dl.rockylinux.org/pub/rocky/9/images/x86_64/$CloudImage
fi

## Setup Contoller node

if [ -f Controller-node.qcow2 ]; then
   virsh destroy Controller-node
   virsh undefine Controller-node
   rm -rf Controller-node.qcow2
fi

echo "Create Controller-node.qcow2"
cp $CloudImage Controller-node.qcow2

echo `pwd`

virt-install --name Controller-node \
--memory 1536 --noreboot \
--os-variant detect=on,name=rocky9-unknown \
--noautoconsole \
--cloud-init user-data=`pwd`"/data-controller/user-data",meta-data=`pwd`"/data-controller/meta-data",network-config=`pwd`"/data-controller/network.cfg" \
--disk=size=10,backing_store=`pwd`"/Controller-node.qcow2"

## Setup Node-01

if [ -f Node-01.qcow2 ]; then
   virsh destroy Node-01
   virsh undefine Node-01
   rm -rf Node-01.qcow2
fi

echo "Create Node-01.qcow2"
cp $CloudImage Node-01.qcow2

echo `pwd`

virt-install --name Node-01 \
--memory 1536 --noreboot \
--os-variant detect=on,name=rocky9-unknown \
--noautoconsole \
--cloud-init user-data=`pwd`"/data-node01/user-data",meta-data=`pwd`"/data-node01/meta-data",network-config=`pwd`"/data-node01/network.cfg" \
--disk=size=10,backing_store=`pwd`"/Node-01.qcow2"

## Setup Node-02

if [ -f Node-02.qcow2 ]; then
   virsh destroy Node-02
   virsh undefine Node-02
   rm -rf Node-02.qcow2
fi

echo "Create Node-02.qcow2"
cp $CloudImage Node-02.qcow2

echo `pwd`

virt-install --name Node-02 \
--memory 1536 --noreboot \
--os-variant detect=on,name=rocky9-unknown \
--noautoconsole \
--cloud-init user-data=`pwd`"/data-node02/user-data",meta-data=`pwd`"/data-node02/meta-data",network-config=`pwd`"/data-node02/network.cfg" \
--disk=size=10,backing_store=`pwd`"/Node-02.qcow2"

## Setup Node-03

if [ -f Node-03.qcow2 ]; then
   virsh destroy Node-03
   virsh undefine Node-03
   rm -rf Node-03.qcow2
fi

echo "Create Node-03.qcow2"
cp $CloudImage Node-03.qcow2

echo `pwd`

virt-install --name Node-03 \
--memory 1536 --noreboot \
--os-variant detect=on,name=rocky9-unknown \
--noautoconsole \
--cloud-init user-data=`pwd`"/data-node03/user-data",meta-data=`pwd`"/data-node03/meta-data",network-config=`pwd`"/data-node03/network.cfg" \
--disk=size=10,backing_store=`pwd`"/Node-03.qcow2"

## Setup Node-04

if [ -f Node-04.qcow2 ]; then
   virsh destroy Node-04
   virsh undefine Node-04
   rm -rf Node-04.qcow2
fi

echo "Create Node-04.qcow2"
cp $CloudImage Node-04.qcow2

echo `pwd`

virt-install --name Node-04 \
--memory 1536 --noreboot \
--os-variant detect=on,name=rocky9-unknown \
--noautoconsole \
--cloud-init user-data=`pwd`"/data-node04/user-data",meta-data=`pwd`"/data-node04/meta-data",network-config=`pwd`"/data-node04/network.cfg" \
--disk=size=10,backing_store=`pwd`"/Node-04.qcow2"