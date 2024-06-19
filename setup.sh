#!/bin/bash
CloudImage=Rocky-9-GenericCloud-Base.latest.x86_64.qcow2

if [ -f $CloudImage ]; then
   echo "Rocky-9 Cloud image is present"
else
   echo "Going to get Rocky-9 Cloud image"
   wget https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud-Base.latest.x86_64.qcow2
fi

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
--cloud-init user-data=`pwd`"/data-test/user-data",meta-data=`pwd`"/data-test/meta-data" \
--disk=size=10,backing_store=`pwd`"/Controller-node.qcow2"