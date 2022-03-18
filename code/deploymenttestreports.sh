#!/bin/bash
#### embedded-linux-pipeline deploy script v0.0.1

# General Properties

PACKAGE_NAME="restapi"

# == Deployment of Package Artifacts==

repo_url="https://artifactory.exampleaddress.com" 
tgt_repo="testreport/${PACKAGE_NAME}"
user="${AUTHENTICATED_USR}"
pass="${ARTIFACTORY_TOKEN}"


 if [[ $f == *"softwarepackage/artifacts"* ]]; then
    echo "<a href=\"${repo_url}/${tgt_repo}\">$f</a><br>" >> artifactory_links.html
fi

status=$(curl -k -u $user:$pass -X PUT -H "X-Checksum-Deploy:true" -H "X-Checksum-Sha1:$sha1" --write-out %{http_code} --silent --output /dev/null "${repo_url}/${tgt_repo}")
echo "status=$status"
# No checksum found - deploy + content
[[ ${status} -eq 404 ]] && {
  curl -k -u $user:$pass -H "X-Checksum-Sha1:$sha1" -T "$f" "${repo_url}/${tgt_repo}"
}
