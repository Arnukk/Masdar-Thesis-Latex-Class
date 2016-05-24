# Using masdar-thesis.cls 
masdar-thesis.cls is an extension of the standard report class.

## Quick start
First copy the class file to your working directory.
Compile the following sample files for PhD and/or Masters to check whether everything is working fine:
- sample-phd.tex    
- sample-master.tex 

## Class Options

\documentclass[option1, option2,...]{masdar-thesis}

You can use any known option of report class, plus the following new options: 

- master: this gives the suitable cover pages text for a master thesis. You need to specify your degree through command \degree{...} since it is needed for the cover page text.
- pdflinks: activates hyperlinks in the document. You can click table of contents, reference, etc, to reach their targeted link
- compact: a useful option during writing thesis. It shrinks the margins, spacing to fit more text into a page. Make sure you remove this option upon submission as it doesn't comply with thesis guidelines. 
- nocover: this option removes the first two cover pages. This sometimes required to get formating approval

Useful options from "report" class:
- twoside: changes headers to make it compatible with double side printng (some times outputs strange results)
- openright: each chapter starts from right page (usually increases the number of pages)


## Important commands
- \lists : show table of contents and list of figures (list of figures is not added currently, because it is just waste of paper, perhaps I will add it in future upon request).
- \title{...}  
- \author{your name}
- \RSCa{Dr. supervisor name }{Affiliation}
- \RSCb{Dr. RSC 2nd member name}{Affiliation}
- \RSCc{Dr. RSC 3rd member if applicable}{Affiliation}
- \RSCd{Dr. RSC 4th member if applicable}{Affiliation}
- \degree{'degree name'}: this is only needed for Master degree

## Environments
- abstract
- dedication
- acknowledgements 

## Dependencies
master-thesis.cls uses several packages. In case you get a strange error, first make sure the following packages are installed in your system: 
- amsthm
- algpseudocode
- algorithm
- times
- helvet
- hyperref
- geometry
- setspace
- fncychap

In ubuntu, you may try to install texlive-latex-extra to obtain all necessary packages: sudo apt-get install texlive-latex-extra 


## Extra Commands
- \customthm{num}[optional text]: useful command to give a custom number to a theorem. This is useful if you provide your proofs in an appendix and you want to refer to a theorem (you may use \ref{.} instead of giving number explicitly).
- \customlem{num}[optional text]: same as above but for lemmas.
