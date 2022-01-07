## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Ansible/Images/Bradley_Olson_Azure_Network_w_ELK_Stack.jpg)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible Playbook files may be used to install only certain pieces of it, such as Filebeat.

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly reliable and efficient, in addition to restricting the back-end servers to the network, through the use of a jump box.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the files and system metric data.

The configuration details of each machine may be found below.

| Name       | Function        | IP Address | Operating System |
|------------|-----------------|------------|------------------|
| Jump Box   | Gateway         | 10.0.0.1   | Linux            |
| Web-1      | DVMA Web Server | 10.0.0.5   | Linux            |
| Web-2      | DVMA Web Server | 10.0.0.6   | Linux            |
| Web-3      | DVMA Web Server | 10.0.0.7   | Linux            |
| ELK Server | Monitoring      | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Elk Server machine can accept connections from the Internet (through Port 5601). Access to this machine is only allowed from the following IP addresses: 96.42.98.42

Machines within the network can only be accessed by the Jump Box (10.0.0.4).

A summary of the access policies in place can be found in the table below.

| Name       | Publicly Accessible | Allowed IP Addresses |
|------------|---------------------|----------------------|
| Jump Box   | No - SSH only       | 96.42.98.42          |
| Web-1      | Yes - Load Balancer | 10.0.0.4 96.42.98.42 |
| Web-2      | Yes - Load Balancer | 10.0.0.4 96.42.98.42 |
| Web-3      | Yes - Load Balancer | 10.0.0.4 96.42.98.42 |
| ELK Server | Yes - Port 5601     | 10.0.0.4 96.42.98.42 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because we do not need to take down the entire system and we can update any number of machines at once which is far more efficient and scalable.

The playbook implements the following tasks:

Use more memory command
Install Docker
Install python3
Install the Docker python module
Download and launch the ELK docker web container
Enable docker service

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Ansible/Images/docker_ps_output.jpg)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:
10.0.0.5 10.0.0.6 10.0.0.7

We have installed the following Beats on these machines:
Filebeat, Metricbeat

These Beats allow us to collect the following information from each machine:

Filebeat monitors changes in files and updates them into logs. One type of log we can monitor is Web Traffic which gives us info on unique visitors and where those visitors are originating from.

Metricbeat monitors system resources on our Web Servers allowing us to analyze CPU usage, DiskIO, and Memory % for example.

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the filebeat-playbook.yml file to your Ansible container.
- Update the filebeat-configuration.yml file to include the IP address of your ELK server along with port 5601.
- Run the playbook, and navigate to your ELK server's public IP address with Port 5601 to check that the installation worked as expected.

