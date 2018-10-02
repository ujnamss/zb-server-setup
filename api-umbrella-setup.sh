# Create a directory called zb for zerobugz
mkdir -p zb/api-umbrella/config
cp api-umbrella.yml zb/api-umbrella/config/api-umbrella.yml
docker run -d --name=api-umbrella -net=host -p 8080:8080 -p 8443:8443 -v "$(pwd)/zb/api-umbrella/config":/etc/api-umbrella nrel/api-umbrella
