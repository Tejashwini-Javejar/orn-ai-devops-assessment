## Question: Describe a Jenkins or GitHub Actions pipeline you built. Include build, test, scan, deploy, approval and rollback.

## Answer:

In my previous project, I used the following tools to build, test and deploy the application:

GitHub – to store the application source code.<br>
Jenkins – to trigger and manage the CI/CD pipeline.<br>
SonarQube– for static code analysis.<br>
Docker – to containerize the application.<br>
Argo CD – to deploy the application to the Kubernetes cluster.<br>

Whenever a developer commits any changes to GitHub, we configured a GitHub webhook to trigger the Jenkins pipeline automatically.As part of the Jenkins pipeline, we used Declarative Pipeline syntax because it is easier to write, maintain and collaborate on.

As part of the jenkins we would used to run the fallowing stages:

Build:
The application was built using Maven to generate the application artifact.

Test:
Once the build was successful, we also executed unit tests to validate the application before deployment.

Static Code Analysis:
After successful testing, we used to performe static code analysis using SonarQube to identify code quality issues, bugs and  security vulnerabilities.

Containerization:
Once all the previous stages were successful, we used docker to build a Docker image from the Dockerfile. The image was then pushed to the container registry.

Deployment:
For deployment, we used Argo CD. We also configured Argo CD Image Updater, which continuously monitors the container registry for new image. Whenever a new image is pushed, it automatically updates the image tag in the Kubernetes manifests stored in GitHub. Argo CD continuously compares the desired state stored in the Git repository with the actual state running in the Kubernetes cluster. If it detects any changes, it automatically synchronizes and deploys the updated application to the cluster.

Approval:
For production deployments, a manual approval stage can be configured in the Jenkins pipeline before deployment. This ensures that  releases are deployed only after approval from the required team.

Rollback:
If a deployment fails or issues are identifined after deployment, Argo CD allows us to roll back to the previous stable application version by syncing the previous Git commit. This enables faster recovery and minimizes downtime.    

I have added the project details under the projects section.
