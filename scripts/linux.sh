#!/usr/bin/env bash

set -e

mk_ram_disk() {
  local ramfs_size_mb=$1
  local mount_point=/tmp/${2}

  if EXISTS=`mount | grep ${mount_point}`; then
    printf "device \"%s\" already mounted" ${mount_point} 1>&2
    exit 1
  fi

  udisks --mount -b /dev/${mount_point}
  
  printf %s ${mount_point//[[:blank:]]/}
}

rm_ram_disk() {
  local mount_point=/tmp/${2}
  udisks --umount /dev/${mount_point}
}

main() {
  if [ "$1" = "1" ]; then
    mk_ram_disk $2 $3
  else
    rm_ram_disk $2
  fi
}

main $@