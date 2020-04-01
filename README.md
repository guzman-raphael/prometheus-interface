# Prometheus Interface for Querying via K8S Proxy

To access Prometheus API, follow these steps:

1. Create a subdirectory `config`
2. Place your `kubectl` config in the subdirectory with the following naming convention: `config/${CLUSTER_NAME}.cnf`.
3. Bring up the service: `docker-compose up --build`

If for any reason it disconnects or is unreachable, simply `docker-compose down` and repeat above steps.