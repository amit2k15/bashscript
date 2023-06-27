---
- name: Install Dynatrace OneAgent
  hosts: all
  become: true

  tasks:
    - name: Download Dynatrace OneAgent installer
      get_url:
        url: "https://<your-environment-id>.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?Api-Token=<your-api-token>"
        dest: /tmp/dynatrace-oneagent.sh
        mode: 0755

    - name: Install Dynatrace OneAgent
      command: /tmp/dynatrace-oneagent.sh APP_LOG_CONTENT_ACCESS=1

    - name: Verify Dynatrace OneAgent installation
      shell: /opt/dynatrace/oneagent/agent/tools/agentinfo.sh
      register: agent_info

    - name: Print Dynatrace OneAgent version
      debug:
        msg: "Dynatrace OneAgent version {{ agent_info.stdout_lines[0] }}"
