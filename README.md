# Information
This project will follow the steps to create a devops infrastructure and then add security to turn it into a devsecops infrastructure.
We will use the following
- Docker (for contenarization)
- Jenkins (for orchestrization)
- Heroku (for deployement)

# Installation
To create a REACT app wou need node and nom, you also need Jenkins to create jobs and Docker for contenarisation.
You might need to install WSL2 and enable virtualization on your BIOS to use Docker.
- install npm and node
- install Docker
- install Jenkins (as a docker container)

# Create project (optional)
To create a project from start run:
```sh
npx create-react-app devsecops
```
create repository on github and link to the react app (github provides clear steps for this)
copy Dockerfile and Jenkinsfile from this repository 

# Clone this project
If you didn't create a new project you can clone this one
```sh 
git clone https://github.com/jcfdsilva/devSecOps.git
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

