docker rm -f great_expectations_sandbox || true
docker run -p 10000:10000 --name great_expectations_sandbox acloudfrontier/great_expectations_sandbox:latest