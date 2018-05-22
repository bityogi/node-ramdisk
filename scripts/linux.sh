#!/usr/bin/env bash

set -e

mk_ram_disk() {
  local ramfs_size_mb=$1
  local mount_point=/dev/${2}

  if EXISTS=`mount | grep ${mount_point}`; then
    printf "device \"%s\" already mounted" ${mount_point} 1>&2
    exit 1
  fi

  mkdir ${mount_point} 
  chmod 777 ${mount_point} 
  udisksctl mount -b ${mount_point}
  
  printf %s ${mount_point//[[:blank:]]/}
}

rm_ram_disk() {
  local mount_point=/dev/${2}
  udisksctl umount -b ${mount_point}
}

main() {
  if [ "$1" = "1" ]; then
    mk_ram_disk $2 $3
  else
    rm_ram_disk $2
  fi
}

main $@