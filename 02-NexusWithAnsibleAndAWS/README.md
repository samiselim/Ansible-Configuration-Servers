
# Nexus Server Setup using Ansible

This Ansible playbook automates the setup of a Nexus server on a designated server.

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/yourusername/ansible-nexus-setup.git
    cd ansible-nexus-setup
    ```

2. Edit the inventory file (`inventory.ini`) with the IP address or hostname of your Nexus server:

    ```ini
    [nexus_server]
    192.168.1.100 ansible_user=your_ssh_user
    ```

3. Run the Ansible playbook:

    ```bash
    ansible-playbook -i inventory.ini nexus_setup.yml
    ```

## Ansible Playbook

The Ansible playbook consists of multiple tasks grouped by their respective roles.

### Task 1: Installing Node using npm

- Updates apt and installs Java OpenJDK version 8 and net-tools.

### Task 2: Download and Unpack Nexus Installer
- Checks Nexus server stats.
- Downloads the Nexus installer if it doesn't exist.
- Unpacks the installer.
- Renames the Nexus folder.

### Task 3: Create new User named nexus
- Creates a Nexus group.
- Creates a Nexus user with the /bin/bash default shell and assigns it to the Nexus group.
- Changes ownership of Nexus and sonatype folders to the Nexus user.

### Task 4: Start nexus using nexus user
- Sets Nexus configuration to run as the nexus user inside the nexus.rc file.
- Starts the Nexus server.

### Task 5: Verify Nexus Running
- Checks Nexus server status using ps and netstat.
- Waits for 1 minute to allow the Nexus server to start.
