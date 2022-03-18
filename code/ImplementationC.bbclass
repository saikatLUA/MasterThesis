python do_fetchtest() {

    bb.note("Download source from ${SRC_URI}")
    src_uri = (d.getVar('SRC_URI', True) or "").split()
    if len(src_uri) == 0:
        bb.fatal("Empty URI")

    try:
        fetcher = bb.fetch2.Fetch(src_uri, d)  
        fetcher.download()
    except bb.fetch2.BBFetchException:
        bb.fatal("Could not fetch the source")
    
    bb.note("Download successful.")
}

addtask do_fetchtest after do_fetch before do_build
