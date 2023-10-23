# Inception
*42 project by Leon Pupier.*

## Description
The Inception project serves as an introduction to the world of system and network administration. The primary objective is to create a Docker-based virtual machine capable of deploying various web services, including an Nginx web server, a WordPress server, and a MySQL database.

## Prerequisites
Before getting started, ensure that you have the following installed on your system:
- Docker: [Download Docker](https://www.docker.com/get-started)
- Docker Compose: [Download Docker Compose](https://docs.docker.com/compose/install/)

## Installation
1. Clone this repository to your local machine:
   ```
   git clone https://github.com/LeonPupier/Inception.git
   ```
2. Navigate to the project directory:
   ```
   cd Inception
   ```
3. Start the Docker containers using Docker Compose by the Makefile:
   ```
   make
   ```

## Usage
Once the containers are up and running, These services are implemented:
- Nginx Server
- WordPress: [http://lpupier.42.fr](http://lpupier.42.fr:443)
- MySQL
