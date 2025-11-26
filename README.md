# OpenSCAD Docker

This Docker image provides OpenSCAD in a containerized environment.

## Usage

This image is not available on DockerHub. To use it, you need to build it locally and run it with Docker Compose.

1.  **Build the image locally:**
    From the root of this repository, run:
    ```bash
    docker build -t openscad .
    ```

2.  **Run with Docker Compose:**
    Ensure you have a `docker-compose.yml` file similar to the following in the root of this repository:
    ```yaml
    version: '3.8'
    services:
      openscad:
        build: .
        image: openscad
        container_name: openscad
        ports:
          - "3000:3000"
          - "3001:3001"
        volumes:
          - ./config:/config
        shm_size: "1gb"
        restart: unless-stopped
    ```
    Then, run:
    ```bash
    docker-compose up -d
    ```

3.  **Access in your browser:**
    Open your web browser and navigate to `https://localhost:3001` or `https://<your-host-ip>:3001`.

This project is not associated with LinuxServer.io.