%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyright 2016 Majid Khonji
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{masdar-thesis}[2016/03/07 Masdar Institute thesis class]



\newif\if@pdflinks
\newif\if@compact
\newif\if@master
\newif\if@nocover
\@pdflinksfalse
\@compactfalse
\@masterfalse
\@nocoverfalse
\DeclareOption{pdflinks}{\@pdflinkstrue}
\DeclareOption{compact}{\@compacttrue}
\DeclareOption{master}{\@mastertrue}
\DeclareOption{nocover}{\@nocovertrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}} %forward other options to report class
\ProcessOptions\relax

\LoadClass[11pt,a4paper]{report}


%%%%% pdflinks option

%%%% packages
\pagestyle{headings}
\usepackage{amsthm}
\usepackage{algpseudocode} % needed to define input/ouput instead of require/ensure
\usepackage[chapter]{algorithm}
\usepackage{times}
\usepackage[scaled=.9]{helvet}% Helvetica, served as a model for arial
\usepackage[Sonny]{fncychap} % provides nice chapter decoration
\usepackage{datetime}
%\usepackage{forarray}
%\usepackage{tikz}



%%%% define abstract %%%%%
\newif\if@dedication
\newif\if@acknowledgement
\@dedicationfalse
\@acknowledgementfalse

\renewenvironment{abstract}%
{\thispagestyle{plain}\null\vfill\begin{center}%
		\bfseries \Large Abstract \end{center}}%
{\vfill\null\pagenumbering{roman} % Roman numerals
	\setcounter{page}{2}\newpage\pagenumbering{arabic}}

\newenvironment{dedication}%
{\thispagestyle{plain}\null\vfill \begin{center} \em}%
{\end{center}\vfill\null\pagenumbering{roman}  
	\setcounter{page}{3}\newpage\pagenumbering{arabic}}

%%%% define acknowledgement %%%%%
\newenvironment{acknowledgments}%
{\thispagestyle{plain}\null\vfill\begin{center}%
		\bfseries \Large Acknowledgments \end{center}}%
{\vfill\null\pagenumbering{roman}  
	\setcounter{page}{4}
	\newpage\pagenumbering{arabic} }


\newcommand{\lists}{\pagenumbering{roman}
	\if@acknowledgement
		\setcounter{page}{5}
	\else
		\setcounter{page}{4}
	\fi
	\tableofcontents  \newpage \pagenumbering{arabic}}
\setcounter{tocdepth}{1} % table of contents: no subsections



%%%%%% spacing, margin
\if@compact % define spacing for a compact version
	\usepackage[top=1in, bottom=1in, left=0.5in, right=0.5in]{geometry}
	\linespread{0.96}
\else
	\usepackage[top=1in, bottom=1in, left=1.25in, right=1.25in]{geometry}
	\usepackage{setspace}
	\doublespacing
\fi
%%%%%% hyper link
\if@pdflinks
	\usepackage[pdftex]{hyperref}
	\hypersetup{%
		pdftitle = {\@title},
		%	pdfsubject = {},
		%	pdfkeywords = {},
		pdfauthor = {\textcopyright\ \@author},
		pdfcreator = {\LaTeX\ with package \flqq hyperref\frqq},
		pdfproducer = {pdfeTeX-0.\the\pdftexversion\pdftexrevision},
		pdfstartview=FitH, % Fit the page horizontally
		bookmarks=true, % Open Bookmarks in AR
		colorlinks=true,
		linkcolor=black,
		anchorcolor=black,
		citecolor=black,
		menucolor=black,
		urlcolor=black,
		pagecolor=black,
		filecolor=black,
		backref=false,
		letterpaper=true,
		breaklinks=true,}
\fi
%%%%%%%%%%%%%%%
\newif\if@RSCa
\newif\if@RSCb
\newif\if@RSCc
\newif\if@RSCd
\@RSCafalse
\@RSCbfalse
\@RSCcfalse
\@RSCdfalse
\newcommand{\raisedrule}[2][0em]{\leaders\hbox{\rule[#1]{1pt}{#2}}\hfill}
\newcommand{\RSCa}[2]{\@RSCatrue \newcommand{\rscaname}{#1} \newcommand{\rscaffil}{#2}}
\newcommand{\RSCb}[2]{\@RSCbtrue \newcommand{\rscbname}{#1} \newcommand{\rscbffil}{#2}}
\newcommand{\RSCc}[2]{\@RSCctrue\newcommand{\rsccname}{#1} \newcommand{\rsccffil}{#2}}
\newcommand{\RSCd}[2]{\@RSCdtrue \newcommand{\rscdname}{#1} \newcommand{\rscdffil}{#2}}

\newif\if@degreeavailable
\newcommand{\degree}[1]{\@degreeavailabletrue\newcommand{\@degreename}{#1}}
\@degreeavailablefalse
%%%%%%%%%%%%%%%%
%%%% title pages
\if@nocover
	\renewcommand{\maketitle}{ }
\else
	\renewcommand{\maketitle}{
		% page 1
		\thispagestyle{empty}
		\begin{center}
			\fontsize{28}{34} \sffamily  \selectfont {\bfseries \@title} \\%
			\vspace{28pt}
			\fontsize{24}{29} \selectfont By\\\@author \\
			\fontsize{18}{22} \selectfont%
			\vspace{40pt}
			A Thesis Presented to the\\
			Masdar Institute of Science and Technology\\
			in Partial Fulfillment of the Requirements of the Degree of\\
			\if@master
			Master of Science\\
			in\\
			Computing \& Information Sciences\\
			\else
			Doctor of Philosophy\\
			in\\ 
			Interdisciplinary Engineering\\
			\fi
			\vspace{70pt}
			$\textcopyright$ \the\year~ Masdar Institute of Science and Technology\\
			All rights reserved%
		\end{center}%
		\vfill
		\newpage	
		%%% page 2
			\thispagestyle{empty}
			\begin{center}
				\fontsize{18}{22} \sffamily  \selectfont {\bfseries \@title} \\%
				\vspace{20pt}
				\fontsize{13.85}{17} \selectfont By \@author \\
				\if@master
				\if@degreeavailable \else
				\ClassError{masdar-thesis} {command ''degree'' not specified } {include your degree via command "degree"}
				\fi
				A Thesis Presented to the Masdar Institute of Science and Technology in
				Partial Fulfillment of the Requirements for the Degree of
				Master of Science in \@degreename\\
				\else
				A Dissertation Presented to the Masdar Institute of Science and Technology
				in Partial Fulfillment of the Requirements for the Degree of
				Doctor of Philosophy In Interdisciplinary Engineering\\
				\fi
				\monthname[\the\month] \the\year
				
	%			\vspace{30pt}
				\vfill
				$\textcopyright$ \the\year~ Masdar Institute of Science and Technology\\
				All rights reserved%
				\vfill
			\end{center}%
		{	\fontsize{12}{15} \selectfont
			AUTHOR’S DECLARATION\\
			I understand that copyright in my Dissertation is transferred\\
			to Masdar Institute of Science and Technology.\\
			Author {\underline{~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~} }\\
					\vfill
			
			\noindent RESEARCH SUPERVISORY COMMITTEE MEMBERS\\
			\begin{tabular}{@{}ll@{}}
			& \hspace{250pt} \\
			\if@RSCa \multicolumn{2}{l}{ \vspace*{-7pt}\rscaname, Chair, \raisedrule{.5pt} } \\
			\hspace*{140pt}& \rscaffil\\ \fi
			\if@RSCb \multicolumn{2}{l}{ \vspace*{-7pt}\rscbname, \raisedrule{.5pt} } \\
			&\rscbffil\\	\fi
			\if@RSCc \multicolumn{2}{l}{ \vspace*{-7pt}\rsccname, \raisedrule{.5pt} } \\
			&\rsccffil\\ \fi
			\if@RSCd \multicolumn{2}{l}{ \vspace*{-7pt}\rscdname, \raisedrule{.5pt} } \\
			&\rscdffil\\ \fi			
			\end{tabular}
	
			  	
		}
	
	
			\newpage
	
		}
	 
\fi
 
%%%%%%%%%%%%%%%%%

\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{fact}[theorem]{Fact}
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{claim}[theorem]{Claim}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{observation}[theorem]{Observation}
\newtheorem{definition}[theorem]{Definition}
{\theoremstyle{remark} \newtheorem{remark}[theorem]{\bf Remark}}

\newtheorem{innercustomthm}{Theorem}
\newenvironment{customthm}[1]
{\renewcommand\theinnercustomthm{#1}\innercustomthm}
{\endinnercustomthm}

\newtheorem{innercustomlem}{Lemma}
\newenvironment{customlem}[1]
{\renewcommand\theinnercustomlem{#1}\innercustomlem}
{\endinnercustomlem}



% replace proof symbole by black square
\def\blksquare{\rule{2mm}{2mm}}
\renewcommand{\qedsymbol}{\blksquare}

\newcommand{\raf}[1]{(\ref{#1})}
\renewcommand{\algorithmicrequire}{\textbf{Input:}}
\renewcommand{\algorithmicensure}{\textbf{Output:}}



%\bibliographystyle{plain} 
\bibliographystyle{ieeetr}


%\usepackage[bottom]{footmisc}
\raggedbottom % remove unnecessary text stretching