# (Work in progress)
# Information
This project will follow the steps to create a devops infrastructure and then add security to turn it into a devsecops infrastructure.
We will use the following
- Docker (for contenarization)
- Jenkins (for orchestrization)
- Heroku (for deployement)

# New Debian machine as server (optional)
add your user as a sudoer and configure the system to not ask for password for the sudo group
```sh
$ su -
$ adduser {myuser} sudo
$ sudo visudo
```
add this line to the end of the file
```sh
$ %sudo  ALL=(ALL) NOPASSWD: ALL
```

### install jenkins
```sh
$ sudo apt install nodejs npm -y
$ sudo apt-get install default-jdk
$ sudo apt-get install curl
...follow instruction in jenkins website for installation
$ sudo systemctl restart jenkins
$ sudo adduser jenkins sudo
```
access localhost:8080

### install docker
```sh
$ sudo apt-get install docker-compose
```

### install heroku cli
Read information on how to install heroku LCI on Debian here:
https://devcenter.heroku.com/articles/heroku-cli#install-with-ubuntu-debian-apt-get^

create ssh key and copy and paste your public key in heroku
```sh
ssh-keygen -t rsa -f ./heroku_rsa -C"$(whoami)@$(hostname)"`
```

# Create project (optional)
To create a project from start run:
```sh
$ npx create-react-app devsecops
```
create repository on github and link to the react app (github provides clear steps for this)
copy Dockerfile and Jenkinsfile from this repository 

# Clone this project
If you didn't create a new project you can clone this one
```sh 
$ git clone https://github.com/jcfdsilva/devSecOps.git
```

# Create heroku app
You can then heroku app by login in and click the button to create a new app
Create the credentials by going to:
- profile > Account settings 
- API Key (section)
- Reveal
- Copy the text revealed

# Configure Jenkins
On Jenkins go to:
- Manage Jenkins
- Manage Credentials
- System
- Global Credentials
- Add Credentials
- Create the credential with:
  - Kind : Secret text
  - Secret : Paste the heroku API key
  - id : copy the credential id on the jenkins file
  - description : as you want

On jenkins create a new job on Dashboard:
- click on new item
- give it a name
- choose pipeline 
- click ok
- On pipeline choose definition: Pipeline script from SCM
- Choose git as SCM
- paste the Git repository URL
- verify the branch name nad the Script Path
- click save and build now

