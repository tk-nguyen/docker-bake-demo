target "docker-metadata-action" {}

target "_common" {
  platforms = ["linux/amd64", "linux/arm64"]
  inherits = ["docker-metadata-action"]
}

function "generate_tags" {
  params = [repo, tags]
  result = formatlist("%s/test:%s", repo, tags)
}

target "test" {
  inherits = ["_common"]
  tags = generate_tags("docker.io", target.docker-metadata-action.tags)
}
