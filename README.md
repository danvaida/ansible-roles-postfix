# Ansible Postfix role

Installation and configuration of Postfix MTA.

## Requirements

None.

## Role Variables

* __postfix_config_templates:__
  List of configuration templates.

* __postfix_postmap_files:__
  List of files to hash with the postmap binary.

* __postfix_tld:__
  TLD to use in mailname.

## Dependencies

None.

## Example Playbook

```
- hosts: servers
  roles:
    - role: postfix
      postfix_config_templates:
        -
          src: 'main.cf.j2'
          dest: '/etc/postfix/main.cf'
          owner: root
          group: root
          mode: '0644'
      postfix_postmap_files:
        - sasl
      postfix_tld: 'heregoes.com'
```

## Testing

If you want to run the tests on the provided docker environment, run the following commands:

```bash
$ cd /path/to/ansible-roles-postfix
$ docker build -t ansible-roles-test tests/support
$ docker run -it -v $PWD:/role ansible-roles-test
```
