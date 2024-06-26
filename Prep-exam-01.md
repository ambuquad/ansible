1) create a static inventory file called /home/student/ansible/inventory so that:
  1) node-01 ia a member of the dev host group
  3) node-02 is a member of the test host group
  4) node-03 and node-04 are members of the prod host group
  5) node-05 is a member of the balancers host group
  6) the prod group is a member of the webservers host group.

2) Create a configuration file called /home/student/ansible/ansible.cfg with following requirements:
  1) priviledged escalation is disabled by default
  2) ansible should manage 8 hosts at a single time
  3) use previously defined inventory file by default
  4) uses /var/log/ansible/execution.log to save information related to playbook execution
  5) roles path should include /home/student/plays/roles
  6) ensure that priviledge escalation method is set to sudo
  7) do not allow ansible to ask for password when elevating privileges

3) Verify the inventory configuration

4) Verify the current Ansible configuration file.

5) If you wish, you can also test by pinging all the managed hosts

6) Create a shell script with the name packages.sh that runs an Ansible ad-hoc command to create a yum repository on all managed hosts using the information as below:
  1) The Docker base URL is https://download.docker.com/linux/centos/$releasever/$basearch/stable
  2) The Docker description is Rocky 9 Docker
  3) The Docker name is Rocky9_Docker
  4) The repositories must be enabled with a gpgkey of https://download.docker.com/linux/centos/gpg

7) Create a playbook that meets following requirements:
  1) Creates a gzip archive containing /etc and stores it at /backup/configuration.gz on the managed hosts.
  2) Is placed at /home/automation/plays/archive.yml
  3) Runs against all host group
  4) Retrieves archives from the managed nodes and stores them at /backup/<hostname>-configuration.gz on the control node
  5) User automation should be owner of /backup and everything underneath. Both on the managed hosts and the control node. Only owner and    members of his group should be able to read and manage files inside. Anyone should be allowed to list contents of /backup.

8) Create a playbook /home/automation/plays/motd.yml that runs on all inventory hosts and does the following:
  1) Populates /etc/motd with text, its content depends on the group, The
  2) proxy group should use Welcome to HAProxy server as the motd.
  3) database group should use Welcome to MySQL database as the motd
  4) webservers should use Welcome to Apache server as the motd.
  5) Is placed at /home/automation/plays/motd.yml

9) Create a playbook that meets following requirements:
  1) Is placed at /home/automation/plays/ansible_facts.yml
  2) Runs against proxy group
  3) Results in possiblity of getting a pair name=haproxy from ansible facts path ansible_local.environment.application after calling setup module
  4) This question less likely to show up in the exam, but it's always good to know how to add facts to ansible_facts.
