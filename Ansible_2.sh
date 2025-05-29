- name: Setup and configure a web server
  hosts: all
  become: yes
  tasks:

    # Uncomment this section for Apache setup
    - name: Install Apache2
      apt:
        name: apache2
        state: present
        update_cache: yes

    - name: Start and enable Apache2
      service:
        name: apache2
        state: started
        enabled: yes

    # Uncomment this section instead for Nginx setup
    # - name: Install Nginx
    #   apt:
    #     name: nginx
    #     state: present
    #     update_cache: yes

    # - name: Start and enable Nginx
    #   service:
    #     name: nginx
    #     state: started
    #     enabled: yes

    - name: Create a custom index.html
      copy:
        dest: /var/www/html/index.html
        content: |
          <html>
          <head><title>Welcome</title></head>
          <body><h1>Welcome to Ansible Configured Web Server</h1></body>
          </html>
