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
  url: https://gitlab.example.com     #Required for all states
  runner:                             #Required for runner state
    token: token
    executor: docker
    docker_image: alpine:latest
    description: description
    tag_list: ""
    run_untagged: "true"
    locked: "false"
    access_level: not_protected
```