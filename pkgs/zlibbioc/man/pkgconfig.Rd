\name{pkgconfig}
\Rdversion{1.1}

\alias{pkgconfig}

\title{
  Retrieve configuration values for PKG_CFLAGS and PKG_LIBS.
}
\description{

  Use \code{pkgconfig} to retrieve \code{PKG_CFLAGS} and \code{PKG_LIBS}
  configuration values to be used in \code{Makevars} files. See
  \code{browseVignettes(package="zlibbioc")}.

}
\usage{

pkgconfig(opt=c("PKG_CFLAGS", "PKG_LIBS_static", "PKG_LIBS_shared"))

}

\arguments{

  \item{opt}{A \code{character(1)}, selected from the values in the
    default parameter values.}

}

\value{

  \code{NULL}; a side effect is that the configuration string is printed
  to \code{stdout}

}

\author{Martin Morgan <mtmorgan@fhcrc.org>.}

\examples{

\dontrun{browseVignettes(package="zlibbioc")}

pkgconfig("PKG_CFLAGS")
pkgconfig("PKG_LIBS_static")

}

\keyword{ manip }
