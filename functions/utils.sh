#!/bin/bash -
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License.

###########################################################################################
#
# Description:
#
# This script contains common functions used in the scenario test
#
###########################################################################################

function get_rg_name ()
{
  deployment_name=$1
  IFS=';' read -r -a vm_cid <<< $(bosh -d ${deployment_name} vms --json | jq -r '.Tables[0].Rows[0].vm_cid')

  for element in "${vm_cid[@]}"
  do
    IFS=':' read -r -a pairs <<< "$element"
    case ${pairs[0]} in
      resource_group_name)
        rg_name=${pairs[1]}
        ;;
    esac
  done
  echo $rg_name
}

function get_vm_name ()
{
  deployment_name=$1
  IFS=';' read -r -a vm_cid <<< $(bosh -d ${deployment_name} vms --json | jq -r '.Tables[0].Rows[0].vm_cid')

  for element in "${vm_cid[@]}"
  do
    IFS=':' read -r -a pairs <<< "$element"
    case ${pairs[0]} in
      agent_id)
        vm_name=${pairs[1]}
        ;;
    esac
  done
  echo $vm_name
}

function get_storage_account_name ()
{
  deployment_name=$1
  IFS=';' read -r -a vm_cid <<< $(bosh -d ${deployment_name} vms --json | jq -r '.Tables[0].Rows[0].vm_cid')

  for element in "${vm_cid[@]}"
  do
    IFS=':' read -r -a pairs <<< "$element"
    case ${pairs[0]} in
      storage_account_name)
        storage_account_name=${pairs[1]}
        ;;
    esac
  done
  echo $storage_account_name
}

function get_vm_name_by_instance_group ()
{
  deployment_name=$1
  instance_group_name=$2
  IFS=';' read -r -a vm_cid <<< $(bosh -d ${deployment_name} vms --json |jq -r --arg instance ${instance_group_name} '.Tables[0].Rows[] | select(.instance | contains($instance)).vm_cid')

  for element in "${vm_cid[@]}"
  do
    IFS=':' read -r -a pairs <<< "$element"
    case ${pairs[0]} in
      agent_id)
        vm_name=${pairs[1]}
        ;;
    esac
  done
  echo $vm_name
}
