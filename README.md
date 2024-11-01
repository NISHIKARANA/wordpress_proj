pipeline setup 
Have use gitaction as my ci/cd tool so for this we use gitaction for pipelines
- create a .github/workflows/deploy.yml file first
- in deploy.yml write the script to build and deploy image in enviornment.
- To run pipeline go in action option and click on run triggers it will do the job
- also have used all credentials in secret for security purpose

AWS setup
- create a ec2 instance in aws
- create a docker-compose.yml file in ec2 intance with necessary requirement and build it.

Script Explanation : 
The pipeline starts when you click a button in GitHub. This is called workflow_dispatch.
Jobs: The pipeline is divided into two main jobs: build and deploy.

Job 1: Build
Steps in the Build Job:
Checkout Code:

This step pulls (downloads) the latest code from your GitHub repository so that the pipeline has the most up-to-date files.
Log in to Docker Hub:

Here, it logs into Docker Hub (a service for sharing Docker images) using your username and password stored securely in GitHub Secrets. This allows you to push your Docker images later.
Build WordPress Image:

This step creates a Docker image for WordPress using a file called Dockerfile. It names the image based on your Docker Hub username and tags it as latest.
Push WordPress Image:

After building the WordPress image, this step uploads (pushes) the image to Docker Hub, making it available for use later.
Pull MySQL Image:

This step downloads the official MySQL Docker image from Docker Hub. MySQL is the database that WordPress uses.
Push MySQL Image (if customized):

If you've made any changes to the MySQL image (customized it), this step uploads that customized image to Docker Hub. It only runs if a specific condition is met (MYSQL_IMAGE_CUSTOMIZED is set to true).
Job 2: Deploy
Steps in the Deploy Job:
SSH to EC2 and Deploy:
This step connects to your EC2 instance (a virtual server in the cloud) using SSH (a secure way to connect to a computer). It then runs a series of commands on the EC2 instance to set everything up.
Commands in the Deployment Step:
Install Docker:

If Docker isn't already installed on the EC2 instance, this command installs it. Docker allows you to run applications in isolated containers.
Install Docker Compose:

Similar to Docker, this command installs Docker Compose, which helps you manage multi-container applications (like WordPress and MySQL together).
Add User to Docker Group:

This command adds the ubuntu user to the Docker group so that the user can run Docker commands without needing to use sudo every time.
Log into Docker Hub:

The script logs into Docker Hub again on the EC2 instance using your credentials.
Pull the Latest Images:

This command downloads the latest versions of your WordPress image and the official MySQL image to the EC2 instance.
Run Docker Compose:

It checks if the docker-compose.yml file (which defines how to run your containers) exists at a specific path. If it does, it runs the command to start up your WordPress and MySQL containers in the background. If the file doesn’t exist, it shows an error message.

To access website :
http://<ec2-ip>
http://16.170.208.105

