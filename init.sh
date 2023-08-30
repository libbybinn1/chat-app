docker build -t mychatappimg --build-arg ENVIRONMENT=development .
docker run -p 5000:5000 --name mychat --memory=1g --memory-reservation=512m --cpus=1 --cpuset-cpus=2 mychatappimg

