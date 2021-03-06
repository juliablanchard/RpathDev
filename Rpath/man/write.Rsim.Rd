% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/write_functions.R
\name{write.Rsim}
\alias{write.Rsim}
\title{Write function for Ecosim object}
\usage{
write.Rsim(Rsim.output, file, ...)
}
\arguments{
\item{Rsim.output}{object created by the rsim.run() function.}

\item{file}{file name for resultant .csv file.  Be sure to include ".csv".}
}
\value{
Writes a .csv file with the start and end biomass and catch per group
from an Rpath.sim object.
}
\description{
Outputs start/end biomass and catch to a .csv file.
}
\seealso{
Other Rpath.functions: \code{\link{adjust.fishing}},
  \code{\link{adjust.forcing}},
  \code{\link{adjust.scenario}},
  \code{\link{check.rpath.params}},
  \code{\link{create.rpath.params}},
  \code{\link{extract.node}}, \code{\link{frate.table}},
  \code{\link{read.rpath.params}},
  \code{\link{rpath.stanzas}}, \code{\link{rpath}},
  \code{\link{rsim.params}}, \code{\link{rsim.plot}},
  \code{\link{rsim.scenario}}, \code{\link{rsim.step}},
  \code{\link{stanzaplot}}, \code{\link{webplot}},
  \code{\link{write.Rpath}},
  \code{\link{write.rpath.params}}
}

