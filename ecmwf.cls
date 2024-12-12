% Created by Alistair Smith, Sunrise Setting Ltd, 7 June 2006
% ecmwf.cls
% ComputerModern

\def\update{2006/09/20 v1.02}

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ecmwf}
[\update\ ECMWF IFS Documentation class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass[twoside]{book}
\RequirePackage[errorshow]{tracefnt}

\RequirePackage{pifont,latexsym,ifthen,amsthm,rotating,alltt,calc,color,textcase,float}
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath}
\RequirePackage{bm,booktabs,multirow,array,longtable}

\usepackage[round]{natbib}

\newcommand{\footersize}{\fontsize{11}{13}\selectfont}
\newcommand{\chaptersize}{\fontsize{20}{24}\selectfont}
\renewcommand{\LARGE}{\fontsize{16}{20}\selectfont}
\renewcommand{\huge}{\fontsize{18}{22}\selectfont}
\renewcommand{\Huge}{\fontsize{22}{26}\selectfont}

\frenchspacing
\raggedbottom
\hyphenpenalty=1000
\pretolerance=8000
\tolerance=9500
\hbadness=8000
\vbadness=9000
\emergencystretch=5pt
\interlinepenalty=0
\brokenpenalty=10000
\displaywidowpenalty=0
\clubpenalty=10000
\widowpenalty=10000
\sloppy

\parindent 0em
\parsep 0\p@
\topsep 0\p@
\setlength\parskip{6pt}

\thinmuskip = 4mu
\medmuskip = 4mu
\thickmuskip = 4mu
\multlinegap = 0pt

%%%%%
\setlength\voffset{-1in}
\setlength\hoffset{-1in}
\topmargin 12mm
\setlength\oddsidemargin{30mm}%back margin on odd pages
\setlength\evensidemargin{20mm}%fore margin on even pages
\setlength\paperwidth{210mm}
\setlength\paperheight{297mm}
%Needed to set PDF page size
\special{papersize=210mm,297mm}

\textwidth=160mm
\textheight=235mm
%\topskip=10pt
\headsep=18pt
\headheight=30pt
\footskip=30pt 

\setcounter{topnumber}{8}
\renewcommand\topfraction{1}
\setcounter{bottomnumber}{3}
\renewcommand\bottomfraction{.8}
\setcounter{totalnumber}{8}
\renewcommand\textfraction{0.1}
\renewcommand\floatpagefraction{.8}
\setcounter{dbltopnumber}{6}
\renewcommand\dbltopfraction{1}
\renewcommand\dblfloatpagefraction{.8}

\def\normalfloatspace{\floatsep 12pt
\textfloatsep 12pt plus 14pt
\intextsep 12pt plus 14pt}
\normalfloatspace

\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}

\def\ifs#1{\vspace*{12pt}\centerline{\huge\bfseries IFS DOCUMENTATION -- #1}\par%
\def\thecycle{#1}}

\def\OI#1{\vspace*{6pt}\centerline{\huge\bfseries Operational implementation #1}\par}

\newcounter{chapapp}
\setcounter{chapapp}{1}

\newcounter{apptocfix}
\setcounter{apptocfix}{1}

\renewcommand\part{%
  %\if@openright
%    \cleardoublepage
%  \else
%    \clearpage
%  \fi
  \thispagestyle{ecmwf}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \def\thepartmark{#1}%
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \Huge\bfseries \MakeTextUppercase{\partname}~\thepart:
       \fi
     \Huge \bfseries \MakeTextUppercase{#2}\par}%
      \@endpart}
\def\@endpart{}

\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

\renewcommand\chapter{\if@openright\clearemptydoublepage\else\clearpage\fi
                    \thispagestyle{ecmwf}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \ifthenelse{\value{chapapp} = 1}{%
                                   \addcontentsline{toc}{chapter}{\protect\numberline{Chapter~\thechapter}#1}}%AS
                                   {%
                                   \addcontentsline{toc}{chapter}{\protect\numberline{Appendix~\thechapter}#1}}%AS
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
\def\@makechapterhead#1{%
  \vspace*{12\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
      %\centerline{\Large\bfseries\MakeTextUppercase{\partname}~\thepart: \MakeTextUppercase{\thepartmark}}\par
      %\vspace*{12\p@}%
      \LARGE\bfseries \@chapapp\space \thechapter
        \par\nobreak
        \vskip 6\p@
      \fi
    \fi
    \interlinepenalty\@M
    \chaptersize \bfseries #1}\par\nobreak
    \vskip 20\p@
  }

\mark{{}{}}
 
\def\ps@ecmwf{\let\@mkboth\markboth
\def\@oddfoot{%
\parbox[b]{\textwidth}{%
\rule{\textwidth}{1.0pt}\\[2pt]
\footersize IFS Documentation -- \thecycle\hfill\thepage}}
\def\@evenfoot{%
\parbox[b]{\textwidth}{%
\rule{\textwidth}{1.0pt}\\[2pt]
\footersize\thepage\hfill IFS Documentation -- \thecycle}}
\def\@oddhead{%
\parbox[b]{\textwidth}{%
\rule{\textwidth}{1.0pt}\\[2pt]
\large\partname~\thepart: \thepartmark\hfill\smash{\raisebox{-6pt}{\includegraphics{ecmwflogo}}}\\[-3pt]
\rule{\textwidth}{1.0pt}}}
\def\@evenhead{%
\parbox[b]{\textwidth}{%
\rule{\textwidth}{1.0pt}\\[2pt]
\large\smash{\raisebox{-6pt}{\includegraphics{ecmwflogo}}}\hfill{\leftmark}\\[-3pt]
\rule{\textwidth}{1.0pt}}}
\let\chaptermark\@gobble
    \let\sectionmark\@gobble
      \let\@mkboth\markboth
      \def\chaptermark##1{%
       \markboth{\@chapapp\ \thechapter: ##1}{\thepartmark}}%
 }%

\setcounter{secnumdepth}{3}
\def\@seccntformat#1{\csname the#1\endcsname\hspace{1em}}
\renewcommand\thesubsubsection{{\normalfont(}\@alph\c@subsubsection\/{\normalfont)}}

\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-2.5ex \@plus -.4ex \@minus -.2ex}%
                                   {+0.01pt}%
                                   {\raggedright\normalfont\large\bfseries\MakeTextUppercase}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-2.0ex\@plus -.3ex \@minus -.2ex}%
                                     {+0.01pt}%
                                     {\raggedright\normalfont\normalsize\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-1.5ex\@plus -.3ex \@minus -.2ex}%
                                     {+0.01pt}%
                                     {\raggedright\normalfont\normalsize\itshape}}
                                     
\usepackage[font=normalsize,textfont={it},labelfont={bf},%
labelsep=space,tableposition=top]{caption}

\usepackage{subfig}

%raggedright inside tabular etc
\def\rr{\setlength{\rightskip}{0pt plus 1fil}}

\usepackage[nohints]{minitoc}
\renewcommand{\mtctitle}{Table of contents}
\renewcommand{\mtcindent}{0pt}
\setcounter{minitocdepth}{2}
\nomtcpagenumbers
\nomtcrule

\let\beforeparttoc\empty
\let\afterparttoc\empty
\def\thispageparttocstyle{\empty}
\renewcommand{\ptctitle}{Table of contents}
\renewcommand{\ptcindent}{0pt}
\setcounter{parttocdepth}{0}
\noptcpagenumbers
\noptcrule
\renewcommand{\mtcgapbeforeheads}{30pt}
\renewcommand{\mtcgapafterheads}{-30pt}
\def\ptcCfont{\large\rmfamily\upshape\bfseries}

\def\parttoc@[#1]{%
\global\@parttoc@used@true
\if@longextensions@%
\def\@tocfile{ptc\Thepart}%
\else
\def\@tocfile{P\Thepart}%
\fi
        \mtc@CkFile{\jobname.\@tocfile}
        \if@mtc@FE
        \mtcPackageInfo[<I0006>]{minitoc}%
           {\jobname.\@tocfile\space is empty}
        \@mtc@empty@parttoc@true
        \else
        \beforeparttoc
        \@ifundefined{chapter}{}{%
        \global\let\mtc@markboth\markboth
        \global\let\@mkboth\markboth
        \thispageparttocstyle
        \mtc@markboth{\MakeUppercase{\ptctitle}}{\MakeUppercase{\ptctitle}}%
        }%
        \relax\begin{samepage}%
        \if #1e\let\do@ptitc\e@pti
        \else\if #1n\let\do@ptitc\n@pti
        \else\if #1c\let\do@ptitc\c@pti
        \else\if #1l\let\do@ptitc\l@pti
        \else\if #1r\let\do@ptitc\r@pti
        \else\if #1d\let\do@ptitc\df@ptitc
        \fi\fi\fi\fi\fi\fi
        \mtc@CkStr{\ptctitle}\if@mtc@FE \let\do@ptitc\e@pti\relax\fi
        \raggedright
        \parskip=\z@%
        \reset@font\ptcfont%
        \parindent=\z@%
        \nopagebreak[4]%
        \kern-0.8\baselineskip\nopagebreak[4]%
        \par\noindent
        \nopagebreak[4]%
        \ifx\ptc@rule\relax
        \begin{tabular}{@{}p{\columnwidth}@{}}
        \reset@font\ptifont\do@ptitc{\mtc@v\ptctitle}\\[10pt]%AS
        \end{tabular}%
        \else
        \begin{tabular}{@{}p{\columnwidth}@{}}
        \reset@font\ptifont\do@ptitc{\mtc@v\ptctitle}\\\hline
        \end{tabular}%
        \fi
        \nopagebreak[4]\null\leavevmode\mtc@zrule\\*[-\baselineskip]\mtc@BBR
        \leftmargin\ptcindent
        \rightmargin\ptcindent
        \itemindent=\z@\labelwidth=\z@%
        \labelsep=\z@\listparindent=\z@%
        \begin{ptc@verse}\c@tocdepth=\c@parttocdepth%
        \leavevmode\\\mtc@BBR
        \vskip -.5\baselineskip
\begingroup
  \makeatletter
  \@ifundefined{ptc@pgno}%
  {\let\@dottedtocline\@undottedtocline}{}
  \@ifundefined{ptc@pgno}%
  {\let\l@chapter@SVPN\l@chapter%
    \def\l@chapter##1##2{\l@chapter@SVPN{##1}{\hbox{}}}}{}
  \@fileswfalse\mtc@hook@beforeinputfile
  \ptc@setform
  \@input{\jobname.\@tocfile}
  \vspace{-1ex} \vspace{-1\baselineskip}
  \leavevmode\mtc@strut
  \global\@nobreakfalse\endgroup
        \end{ptc@verse}%
        \kern-1.\baselineskip%
        \nopagebreak[4]\ptc@rule\null\leavevmode\\%
        \vskip-1.0\baselineskip\mtc@zrule\end{samepage}%
        \par\@ifundefined{chapter}{\pagebreak[1]\vspace*{-1ex}}%
        \afterparttoc\fi}%

\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    %AS\vskip 1.0em \@plus\p@
    \vskip 0.0em \@plus\p@
    \ifthenelse{\value{apptocfix} = 1}{%
     \setlength\@tempdima{5.5em}}%AS
    {\setlength\@tempdima{6.25em}}
     \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      #1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\renewcommand*\l@section{\@dottedtocline{1}{0em}{2.6em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{3.1em}{3.5em}}

\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne 
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\def\makelabel##1{##1\hss}%
    \labelsep=3\p@\parsep=0pt\listparindent=0pt\itemsep=0pt\partopsep=0pt
    \rightmargin=0pt}\fi}

\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
    \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
    \list{\csname\@itemitem\endcsname}{\def\makelabel##1{##1\hss}%
    \labelsep=2\p@\parsep=0pt\listparindent=0pt\itemsep=0pt\partopsep=0pt
    \rightmargin=0pt}\fi}

\renewcommand{\appendix}{%
\setcounter{section}{1}
\renewcommand{\thesection}{\Alph{section}}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\setcounter{subsection}{0}
\setcounter{equation}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\renewcommand\theequation
  {\thesection.\@arabic\c@equation}
\renewcommand \thefigure
     {\thesection.\@arabic\c@figure}
\renewcommand \thetable
     {\thesection.\@arabic\c@table}
}

\newcommand{\appendixend}{%
\renewcommand \thesection {\thechapter.\@arabic\c@section}
\renewcommand\theequation
  {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@equation}
\renewcommand \thefigure
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@figure}
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter.\fi \@arabic\c@table}
\renewcommand\thesubsubsection{{\normalfont(}\@alph\c@subsubsection\/{\normalfont)}}
}

\newcommand\chapappendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \addtocounter{chapapp}{1}
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}

\renewcommand\bibname{References}
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname
        \@mkboth{\bibname}{\bibname}}%
        \addcontentsline{toc}{chapter}{\bibname}
        \vspace*{-12pt}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\renewcommand\theenumi{\@roman\c@enumi}
\renewcommand\labelenumi{(\theenumi)}

\def\red#1{\textcolor{red}{#1}}

\pagestyle{ecmwf}
