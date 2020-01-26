#!/bin/bash

# Last available nextcloud version
next_version="18.0.0"

# Nextcloud tarball checksum sha256
nextcloud_source_sha256="194095a5586d84040bc455f77b8aa6c80f9a6a6dd713c9aebdad046713d4267b"

# This function will only be executed upon applying the last upgrade referenced above
last_upgrade_operations () {
  # Patch nextcloud files only for the last version
  cp -a ../sources/patches_last_version/* ../sources/patches

  # Execute post-upgrade operations later on
  (cd /tmp ; at now + 10 minutes <<< "(cd $final_path ; sudo -u $app php occ db:add-missing-indices ; sudo -u $app php occ db:convert-filecache-bigint -n) > /tmp/${app}_maintenance.log")
}
