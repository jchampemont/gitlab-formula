{% from 'gitlab/map.jinja' import gitlab with context %}

gitlab.dependencies:
  pkg.installed:
    - pkgs:
      - ca-certificates
      - gnupg
      - apt-transport-https

deb https://packages.gitlab.com/gitlab/gitlab-ce/{{ salt['grains.get']('os')|lower }}/ {{ salt['grains.get']('oscodename')|lower }} main:
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/gitlab_gitlab-ce.list
    - key_url: https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey

deb-src https://packages.gitlab.com/gitlab/gitlab-ce/{{ salt['grains.get']('os')|lower }}/ {{ salt['grains.get']('oscodename')|lower }} main:
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/gitlab_gitlab-ce.list
    - key_url: https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey

EXTERNAL_URL:
  environ.setenv:
    - value: {{ gitlab.server.external_url }}

gitlab-ce:
    pkg.installed