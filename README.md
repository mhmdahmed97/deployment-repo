# Deployment-repo
This repository consists of a docker-compose file that builds docker images from 2 different code repositories, then the CI/CD workflow comes into play where it builds and publishes images from the code repositories to ECR and then deploys the application on ECS

`Assumption: both code repos are microservices of the same ECS cluster, thats why they are being deployed in the same cluster`

# Consists of 2 files
  - docker-compose.yaml
  - .github/workflows/main.yaml
# Docker Compose:
Builds docker images from 2 different code repositories.
  - `github-repo-1`
  - `github-repo-2`
 
These repositories could be of any stack. We can also add relevant Database containers and make sure that the application containers indefinitely depend on database containers.

# main.yaml
This is the CI/CD workflow file and it consists of the following jobs, the jobs also have their steps mentioned.
  - Deploy
    - Code checkout
    - Code build : `This stage is omitted from the code as there was no application to build`
    - Code test : `This stage is omitted from the code as there was no application to build`
    - Configure AWS credentials
    - Log in to AWS ECR
    - Build and push App1 image
    - Build and push App2 image
    - Update ECS service
  - Update-google-sheet
    - Record deployment start time in Google Sheets
    - Wait for Deployment to Complete
    - Check deployment status
    - Record deployment end time and status in Google Sheets


