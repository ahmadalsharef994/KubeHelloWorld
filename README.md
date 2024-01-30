

## Overview
This project demonstrates the deployment of a simple "Hello World" web application using ReactJS, containerized with Docker, and orchestrated with Kubernetes. The setup runs locally using Kind.

## Tools Used
- **ReactJS Web Application**: A basic web application displaying "Hello World".
- **Docker Integration**: Docker Desktop Containerization of the ReactJS application.
- **Kubernetes Deployment**: Local deployment using Kind, with a pod and a NodePort service configuration.


## Installation and Setup

### Step-by-Step Guide
1. **Install Docker Desktop**

2. **Install Kind**

3. **Create a Kubernetes Cluster with Kind**:
   ```shell
   kind create cluster
   ```
   The command creates a Docker image `kindest/node` and a Docker container `kind-control-plane`.

4. **Develop the Hello World App**: A basic ReactJS application displaying a "Hello World" message.

5. **Create a Dockerfile**: Dockerfile for building the ReactJS app Docker image.

6. **Build and Tag the Docker Image**:
   ```shell
   docker build -t hello-world-webserver .
   ```

7. **Load the Docker Image into Kind**:
   ```shell
   kind load docker-image hello-world-webserver
   ```
   Since Kind runs in Docker Desktop, this loads the locally built image into the Kind cluster.

8. **Create Pod Configuration File (`hello-world-pod.yaml`)**

9. **Create Service Configuration File (`hello-world-service.yaml`)**

10. **Apply the pod and service files**
   ```shell
   kubectl apply -f hello-world-pod.yaml
      kubectl apply -f hello-world-service.yaml
   ```
10. **Check Services and Ports**:
   ```shell
   kubectl get pods
   kubectl get services
   ```
   Verify the pod and service are correctly set up. Note the exposed port (30007 as configured in hello-world-service.yaml)

10. **Testing the Application**: Access the application on `localhost:30007`.
If direct access isn't working, do port-forwarding:

11. **Port Forwarding**:
    ```shell
    kubectl port-forward service/hello-world-service 30007:80
    ```
    This forwards traffic from your port 30007 to the service's port 80, enabling access to the application at `http://localhost:30007`.



