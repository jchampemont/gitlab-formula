# gitlab-formula
Formula for GitLab (https://about.gitlab.com/).

See the full [Salt Formulas installation and usage instructions](http://docs.saltstack.com/en/latest/topics/development/conventions/formulas.html).

## Available states
### `gitlab.server`
Installs GitLab CE Server.

Example pillar:

```
gitlab:
  server:
    external_url: https://gitlab.example.com
```