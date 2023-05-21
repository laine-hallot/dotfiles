#!/bin/bash

function getLocationData() {
  local -n arr=$1             # use nameref for indirection
  ipInfo=$(curl ipinfo.io -s);
  timezone=$(echo $ipInfo | jq -r .timezone);
  region=$(echo $ipInfo | jq -r .region);
  city=$(echo $ipInfo | jq -r .city);
  loc=$(echo $ipInfo | jq -r .loc)


  echo $timezone $city $region $loc;
  arr=($timezone $city $region $loc)
}
