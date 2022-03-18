inherit packageclass
#SRC_URI in user defined variable
SRC_URI += "git://github.boschdevcloud.com/TT-RHC-Third-Party-Projects/restapi;\
protocol=http;branch=master;name=restapi-tree;destsuffix=restapi-tree"
SRCREV_restapi-tree = "fc57aa0788f663a42d5870b42c71b3284617d147"