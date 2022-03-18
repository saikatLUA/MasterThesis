inherit packagetestreports
MIRRORS += ''
#The Software package SRC_URI
SRC_URI += "gitsm://sourcecode.socialcoding.bosch.com/scm/icomlx/${BPN};\
protocol=http;branch=wallbox;name=restapi"
SRC_URI += "git://github.boschdevcloud.com/TT-RHC-Third-Party-Projects/restapi;\
protocol=http;branch=master;name=restapi-tree;destsuffix=restapi-tree"

SRCREV_restapi = "d094333db360da57933b1899eb6dcf475e4f2eb3"
SRCREV_restapi-tree = "fc57aa0788f663a42d5870b42c71b3284617d147"
SRCREV_FORMAT = "restapi_restapi-tree"

#The Software package test reports SRC_URI
PACKAGETESTREPORTS_SRC_URI = "https://CHS1LOL:AKCp8k8smyRE4djt3dSKWj7\
@artifactory.boschdevcloud.com/artifactory/lab000074-wallbox-yocto-build-dev-local/\
${PN}/testreports/${PN}-${PV}.tar.gz"
PACKAGETESTREPORTS_SUBPATH = "${PN}-${PV}"
