inherit packageclass

SRC_URI += "git://github.boschdevcloud.com/TT-RHC-Third-Party-Projects/restapi;\
protocol=http;branch=master;name=restapi-tree;destsuffix=restapi-tree"
SRCREV_restapi-tree = "fc57aa0788f663a42d5870b42c71b3284617d147"
#SRC_URI in user defined variable
TESTREPORTS_SRC_URI = "https://artifactory.boschdevcloud.com/artifactory\
/lab000074-wallbox-yocto-build-dev-local/${PN}/testreports/${PN}-${PV}.tar.gz"
TESTREPORTS_SUBPATH = "${PN}-${PV}"
TESTREPORTS_CHECKSUM = "7a259e11c33a9b2559bea107a21\
f6e1d9c8220fc6c379f7b2528a494c5b962f5"