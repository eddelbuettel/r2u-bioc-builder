.onLoad <-
    function(libname, pkgname)
{
    ## make DLL available for Windows; others use static library
    if ("windows" == .Platform$OS.type) {
        dll <- file.path(libname, pkgname, "libs", .Platform$r_arch,
                         "zlib1bioc.dll")
        dyn.load(dll)
    }
}

pkgconfig <-
    function(opt=c("PKG_CFLAGS", "PKG_LIBS_static",
               "PKG_LIBS_shared"))
{
    opt <- match.arg(opt)
    pth <- system.file("libs", package="zlibbioc", mustWork=TRUE)
    if (nzchar(.Platform$r_arch)) {
        arch <- sprintf("/%s", .Platform$r_arch)
    } else {
        arch <- ""
    }
    uname <-
        if ("windows" == .Platform$OS.type) "windows"
        else if ("Darwin" == system("uname -s", intern=TRUE)) "darwin"
        else "other"

    PKG_CFLAGS <-
        switch(uname, darwin="",
               sprintf('-I"%s"',
                       system.file("include", package="zlibbioc")))

     PKG_LIBS_static <-
        switch(uname,
               darwin="-lz",
               sprintf('"%s%s/libzbioc.a"', pth, arch))

     PKG_LIBS_shared <-
        switch(uname,
               windows=sprintf('-L"%s%s" -lzlib1bioc', pth, arch),
               darwin="-lz",
               sprintf('-L"%s%s" -Wl,-rpath,"%s%s" -lzbioc', pth,
                       arch, pth, arch))

    cat(list(PKG_CFLAGS=PKG_CFLAGS, PKG_LIBS_static=PKG_LIBS_static,
             PKG_LIBS_shared=PKG_LIBS_shared)[[opt]])
}
.onAttach <- function(libname, pkgname) {
    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname, "3.22")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}
