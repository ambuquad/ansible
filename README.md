# ansible-exam prep

You need at least v3.0.0 of virt-manager(virt-install) for --cloud-init support
See https://github.com/virt-manager/virt-manager/releases

Repo for quick setup of your ansible-exam(EX-294) prep lab.

Just execute setup.sh

User: student
Pass: 2stu3dent

192.168.122.100 controller.examprep.loc controller
192.168.122.101 node-01.examprep.loc node-01
192.168.122.102 node-02.examprep.loc node-02
192.168.122.103 node-03.examprep.loc node-03
192.168.122.104 node-04.examprep.loc node-04
192.168.122.105 node-05.examprep.loc node-05

## Virt-install nice to know

See OS list                 - virt-install --osinfo list
Show cloud-init options     - virt-install --cloud-init=?

/var/lib/cloud/
/etc/cloud/cloud.cfg
/etc/sysconfig/network-scripts

Example of converting V2 to sysconfig:

cloud-init devel net-convert --network-data v2.yaml --kind yaml \
   --output-kind sysconfig -d target
