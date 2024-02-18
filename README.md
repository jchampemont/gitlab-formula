# gitlab-formula
Formula for GitLab (https://about.gitlab.com/).

See the full [Salt Formulas installation and usage instructions](http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

## Available states
### `gitlab.server`
Installs GitLab CE Server.
### `gitlab.runner`
Installs and registers a GitLab Runner.

**Only docker executor is supported for now**

## Example pillar:

```
gitlab:
  version: 16.9.0-ce.0                #Make sure to set the version and follow official Gitlab upgrade paths
  url: https://gitlab.example.com     #Required for all states
  runner:                             #Required for runner state
    version: 16.9.0-1
    token: token
    executor: docker
    docker_image: alpine:latest
```