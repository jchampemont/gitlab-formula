{% from 'gitlab/map.jinja' import gitlab with context %}

gitlab.runner.dependencies:
  pkg.installed:
    - pkgs:
      - gnupg
      - apt-transport-https
      - docker.io

deb https://packages.gitlab.com/runner/gitlab-runner/{{ salt['grains.get']('os')|lower }}/ {{ salt['grains.get']('oscodename')|lower }} main:
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/runner_gitlab-runner.list
    - key_url: https://packages.gitlab.com/runner/gitlab-runner/gpgkey

deb-src https://packages.gitlab.com/runner/gitlab-runner/{{ salt['grains.get']('os')|lower }}/ {{ salt['grains.get']('oscodename')|lower }} main:
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/runner_gitlab-runner.list
    - key_url: https://packages.gitlab.com/runner/gitlab-runner/gpgkey

gitlab-runner:
    pkg.installed:
      - version: {{ gitlab.runner.version }}
      - refresh: True

gitlab-runner register --non-interactive --url "{{ gitlab.url }}" --token "{{ gitlab.runner.token }}" --executor "{{ gitlab.runner.executor }}" --docker-image {{ gitlab.runner.docker_image }}"":
  cmd.run:
    - unless: grep token /etc/gitlab-runner/config.toml