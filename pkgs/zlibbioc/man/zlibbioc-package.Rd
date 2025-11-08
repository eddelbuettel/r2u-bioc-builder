\name{zlibbioc-package}
\Rdversion{1.1}
\alias{zlibbioc-package}
\alias{zlibbioc}

\docType{package}
\title{
  An R packaged zlib-1.2.5
}
\description{

  This package is interesting to package developers only, and uses the
  source code of zlib-1.2.5 to create libraries for systems that do not
  have these available via other means (most Linux and Mac users should
  have system-level access to zlib, and no direct need for this
  package). See the vignette for instructions on use.

}
\details{

  Instructions for use are in the vignette, available with
  \code{browseVignettes(package="zlibbioc")}

}
\author{
Author: Martin Morgan

Maintainer: Biocore Team c/o BioC user list <bioconductor@stat.math.ethz.ch>
}
\references{
  \url{http://zlib.net/}
}

\keyword{ package }
\examples{
packageDescription('zlibbioc')
}
