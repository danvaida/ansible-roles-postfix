#!/bin/bash
set -e

cd /role/tests

ansible-playbook -i inventory test_defaults.yml test.yml

# running a second time to verify playbook's idempotence
set +e
ansible-playbook -i inventory test.yml > /tmp/second_run.log

tail -n 5 /tmp/second_run.log | grep 'failed=0' ||
{
  cat /tmp/second_run.log
  echo 'Playbook failed during the second run.'
  exit 1
}

{
  tail -n 5 /tmp/second_run.log | grep 'changed=0' &&
    echo 'Playbook is idempotent.'
} || {
   cat /tmp/second_run.log
   echo 'Playbook is **NOT** idempotent'
   exit 1
   }
