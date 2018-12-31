aws ecr get-login --no-include-email | bash
docker build -f Dockerfile.hugo -t $(terraform output repository_url) .
docker push $(terraform output repository_url)