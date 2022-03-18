#--------------------------------------------
# Inherit package testreports from the Jfrog artifactory
# and place it under deploy inside the /tmp in 
#the BUILD dir
#--------------------------------------------

def packagetestreports_srcrev(d):  
    srcrev = d.getVar('PACKAGETESTREPORTS_SRCREV')
    return srcrev

def packagetestreports_src_uri(d):  
    src_uri = d.getVar('PACKAGETESTREPORTS_SRC_URI')
    return src_uri

PACKAGETESTREPORTS_SRCURI ?= "${@packagetestreports_src_uri(d)}"

def packagetestreports_subpath(d):  
   subpath = d.getVar('PACKAGETESTREPORTS_SUBPATH')
   return subpath

PACKAGETESTREPORTS_SUBPATH ?= "${@packagetestreports_subpath(d)}"

PACKAGETESTREPORTS_DEST = "${DL_DIR}"

packagetestreports_do_install[noexec] = "1"

python do_fetchtest() {
   src_uri = (d.getVar('PACKAGETESTREPORTS_SRCURI') or "").split()
   if len(src_uri) == 0:
      return
   try:
      fetcher = bb.fetch2.Fetch(src_uri, d)
      fetcher.ud[src_uri[0]].ignore_checksums = True   
      fetcher.download()
      fetcher.unpack(d.getVar('PACKAGETESTREPORTS_DEST'))
   except bb.fetch2.BBFetchException as e:
      bb.fatal(str(e))
}

addtask do_fetchtest after do_fetch before do_build

PACKAGETESTREPORTS_DEPLOYDIR = "${DEPLOY_DIR}/testreports/${PN}"

packagetestreports_do_install(){
   install -d ${PACKAGETESTREPORTS_DEPLOYDIR}
   cp -r ${PACKAGETESTREPORTS_DEST}/${PACKAGETESTREPORTS_SUBPATH}  ${PACKAGETESTREPORTS_DEPLOYDIR}
}

EXPORT_FUNCTIONS do_install