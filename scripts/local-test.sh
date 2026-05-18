docker build -t dev-environment .
docker run -m 16g -p 2222:22 dev-environment
