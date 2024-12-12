%Rules of Use
%
%This class file is made available for use by authors who wish to prepare an
%article for publication in the Quarterly Journal of the Royal Meteorological Society.
%The user may not exploit any part of the class file commercially.
%
%This class file is provided on an `as is'  basis, without warranties of any
%kind, either expressed or implied, including but not limited to warranties of
%title, or  implied  warranties  of  merchantablility  or  fitness  for  a
%particular purpose.  There will be no duty on the author[s] of the software
%or The Royal Meteorological Society to correct any errors or defects in the software.
%Any  statutory  rights you may have remain unaffected by your acceptance of
%these rules of use.
%---------------------------------------------------------------------------
%
% Created by Alistair Smith, Sunrise Setting Ltd, 14 February 2001
% Amendments 1/5/01
% Amendments 9/7/01
% Amendments 8/8/01
% Amendments 18/9/01 changes to appendix code
% Amendments 3/1/02 change to \footnotesep and itemize/enumerate
% DOI facility added 9/8/02
% qjrms2.cls --- For Q. J. R. Meteorol. Soc.

\def\update{2002/08/09 v2.1}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{qjrms2}[\update\ Q. J. R. Meteorol. Soc.]

\newcommand\hmmax{0}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}
\RequirePackage[dvips]{graphics}
\def\Times{\RequirePackage{times}}
%\RequirePackage[mtbold,mtpluscal]{mathtime}
\RequirePackage{latexsym,ifthen,theorem,calc}
\RequirePackage{amsfonts,amssymb,amsbsy,amsmath}
\RequirePackage{bm}
\RequirePackage[errorshow]{tracefnt}

\renewcommand{\normalsize}{\fontsize{11}{12pt}\selectfont}
\renewcommand{\small}{\fontsize{9}{11pt}\selectfont}
\renewcommand{\footnotesize}{\fontsize{8}{10pt}\selectfont}
\renewcommand{\scriptsize}{\fontsize{7}{9pt}\selectfont}
\renewcommand{\tiny}{\fontsize{6}{7pt}\selectfont}
\renewcommand{\large}{\fontsize{12}{14pt}\selectfont}
\renewcommand{\Large}{\fontsize{13}{18pt}\selectfont}
\renewcommand{\LARGE}{\fontsize{17}{22pt}\selectfont}
\renewcommand{\huge}{\fontsize{20}{26pt}\selectfont}
\renewcommand{\Huge}{\fontsize{25}{30pt}\selectfont}

\newcommand{\summsize}{\fontsize{8.5}{9pt}\selectfont}
\newcommand{\sectsize}{\fontsize{10}{11pt}\selectfont}
\newcommand{\tabsize}{\fontsize{8.5}{10pt}\selectfont}
\newcommand{\mastsize}{\fontsize{15}{12pt}\selectfont}

%Page and general

\setlength\parskip{0pt}
\def\le{\leqslant}
\def\ge{\geqslant}

\@twosidetrue
\flushbottom
\frenchspacing
\voffset -48pt
\parindent 2em
\textwidth 384pt
\textheight 600pt
\topmargin 10mm
\oddsidemargin 14mm
\evensidemargin 20mm
\headsep 17pt
\headheight 60pt
\footskip 18pt
\hyphenpenalty=150
\brokenpenalty=10000
\displaywidowpenalty=0
\clubpenalty=10000
\widowpenalty=10000
\pretolerance=500
\tolerance=1000
\hbadness=8000
\vbadness=8000
\setlength{\abovedisplayskip}{8\p@ plus2\p@ minus5\p@}
\setlength{\belowdisplayskip}{\abovedisplayskip}
\setlength{\abovedisplayshortskip}{\z@ plus3\p@}
\setlength{\belowdisplayshortskip}{6\p@ plus3\p@ minus3\p@}
\setcounter{topnumber}{5}
\def\topfraction{.9}
\setcounter{bottomnumber}{5}
\def\bottomfraction{.9}
\setcounter{totalnumber}{20}
\def\textfraction{0.1}
\def\floatpagefraction{.85}

\def\refname{References}
\def\figurename{Figure}
\def\tablename{Table}
\def\abstractname{SUMMARY}

\theorembodyfont{\itshape}
\theoremheaderfont{\normalfont\bfseries}
\setlength{\theorempreskipamount}{6pt plus 2pt}
\setlength{\theorempostskipamount}{6pt plus 2pt}

\begingroup \makeatletter
\gdef\th@plain{\normalfont\itshape
  \def\@begintheorem##1##2{%
        \item[\hskip\labelsep \theorem@headerfont ##1\ {##2:}]}%
\def\@opargbegintheorem##1##2##3{%
   \item[\hskip\labelsep \theorem@headerfont ##1\ ##2\ (##3)]}}
\endgroup


% Title page

% print integer as a zero filled 2 digit field
\def\twodigits#1{\ifnum #1 < 10{0#1}\else{#1}\fi}

% print integer as a zero filled 4 digit field
\def\fourdigits#1{\ifnum #1 < 10{000#1}\else
  \ifnum #1 < 100{00#1}\else
    \ifnum #1 < 1000{0#1}\else{#1}\fi
  \fi
\fi}

\def\ps@myempty{\let\@mkboth\@gobbletwo
     \def\@oddhead{}
     \def\@oddfoot{\small\hfil\thepage\hfil}%
     \def\@evenhead{}
     \let\@evenfoot\@oddfoot
     \headsep 19pt}  %   first page


%First page catchline
%QJRMS{first page}{last page}{vol}{year}{doi}
\def\QJRMS#1#2#3#4#5{
\gdef\@mymainhead{\parbox[t]{\textwidth}{\summsize\textit{Q.\ J.\ R.\ Meteorol.\ Soc.}\ (#4),\ \textbf{#3},\ \ifnum #1 = #2 p.\ #2 \else pp.\ #1--#2\fi%
\hfill doi:\ 10.1256/q\hspace{0.5pt}j.#5}}%
\setcounter{page}{#1}%
\def\theyear{#4}}

\def\ps@myplain{\let\@mkboth\@gobbletwo
  \def\@oddhead{\parbox[b]{\textwidth}{\@mymainhead}}
  \def\@evenhead{}
  \def\@oddfoot{\small\hfil\thepage\hfil}
\def\@evenfoot{}
\headsep 19pt}

\def\rmscopyright{\footnotetext[0]{{}\hspace*{-3pt}\copyright\ Royal Meteorological Society, \theyear.}}
\gdef\crowncopyright{\footnotetext[0]{{}\hspace*{-3pt}\copyright\ Crown copyright, \theyear.}}

\thispagestyle{myplain}

%Headers and footers for non-title pages

\def\runningheads#1#2{\markboth{#1}{#2}}

\def\ps@qjrms{
\let\@mkboth\@gobbletwo
\def\@evenhead{\parbox[b]{\textwidth}{\small%
\thepage\hfill\summsize\textsc{\leftmark}\hfill\small\phantom{\thepage}}}
\def\@oddhead{\parbox[b]{\textwidth}{\small%
\phantom{\thepage}\hfill\summsize\textsc{\rightmark}\small\hfill\thepage}}
\def\@evenfoot{}
\def\@oddfoot{\@evenfoot}
}

\pagestyle{qjrms}

%%%%%%%%%
%Title, author, etc

\def\title#1{{\parsep=0pt
 \large\baselineskip=14pt\centering#1\par}
 \vspace{10pt}}

\def\author#1{{\summsize\baselineskip=9pt\centering By #1\par}
 \vspace{2pt}}

\def\affiliation#1{{\summsize\it\centering#1\par}
 \vspace{10pt}}
\def\address#1{\affiliation{#1}}

\def\date#1{\scriptsize{\centering#1\par}
 \vspace{10pt}}
\def\recd#1{\date{#1}}

\def\summary{\centerline{\summsize\textsc{Summary}}\par
 \vspace{2pt}\summsize\parindent 2em}%

\def\endsummary{\endlist\normalsize}

\def\abstract{\summary}
\def\endabstract{\endsummary}


%\def\pa{\hfill\break\hspace*{19pt}}
%\def\summary#1{\centerline{\summsize\textsc{Summary}}\par
%\vspace{2pt}\summsize\parindent 2em\indent #1\par
%\normalsize}

\def\sixu{\hbox to .333em{}}
\def\ksp{\sixu\sixu\ }
\def\keywords#1{\vspace{9pt}
\summsize{\textsc{Keywords}:\ksp#1}\par
\normalsize}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%
% headings

\newcounter{ahead}
\newlength{\aboveaheadskip}
\setlength{\aboveaheadskip}{18pt plus 18pt minus 6pt}

\def\noahead{\setcounter{bhead}{0}\vskip\aboveaheadskip
\normalsize\baselineskip=12pt\parindent 2em}

\def\ahead#1{\pagebreak[3]\par
 \setcounter{bhead}{0}%\resetequationmaybe
 \refstepcounter{ahead}
 \vskip\aboveaheadskip
 {\centering\theahead.\quad\textsc{#1}\par}
 \vskip6pt}

\def\aheadx#1{\pagebreak[3]\par
 \vskip\aboveaheadskip
 {\centering\textsc{#1}\par}
 \vskip6pt}

\newcounter{bhead}
\def\thebhead{\alph{bhead}}

\def\bhead#1{\pagebreak[3]\par%\resetequationmaybe
 \refstepcounter{bhead}
 \vskip12pt plus 9pt minus 3pt
 {\centering(\ifnum\c@bhead=6\,\fi
 {\it\thebhead}\ifnum\c@bhead=6\,\fi\ifnum\c@bhead=4\hspace{1pt}\fi%
 )\quad{\it#1}\par}
 \vskip3pt}

\def\bheadx#1{\pagebreak[3]\par
 \vskip12pt plus 9pt minus 3pt
 {\centering\it#1\par}
 \vskip3pt}

\def\abhead#1#2{\refstepcounter{ahead}\pagebreak[3]\par
 \vskip\aboveaheadskip
 \begin{samepage}
 \centering\theahead.\quad\textsc{#1}\par
 \setcounter{bhead}{0}
 \refstepcounter{bhead}
 \vskip6pt
 ({\it\thebhead})\quad{\it#2}\par
 \end{samepage}
 \vskip3pt}

\def\abheadx#1#2{%
\addtocounter{section}{1}%
\setcounter{subsection}{0}%
\setcounter{subsubsection}{0}%
\setcounter{equation}{0}%
\setcounter{figure}{0}%
\setcounter{table}{0}%
\vskip\aboveaheadskip
 \begin{samepage}
 \centering\sectsize\textsc{#1}\par
 \vskip6pt
 {\normalsize\it#2}\par
 \end{samepage}
 \vskip3pt}

\def\chead#1#2{\vskip6pt plus 6pt\noindent\rm #1\quad{\it #2}\ }

\def\acknowledgements{\aheadx{Acknowledgements}}
\def\acknowledgement{\aheadx{Acknowledgement}}
\def\acks{\aheadx{Acknowledgements}}
\def\ack{\aheadx{Acknowledgement}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%define section heads etc for style

\def\thesection{\arabic{section}}
\def\thesubsection {\rm (\ifnum\c@subsection=6\,\fi
 {\it\alph{subsection}}\ifnum\c@subsection=6\,\fi
 \ifnum\c@subsection=4\hskip1pt\fi%
 )}

%\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
%\def\theparagraph{\thesubsubsection.\arabic{paragraph}}
%\def\thesubparagraph{\theparagraph.\arabic{subparagraph}}

%%%%%%%%%%%
\renewcommand{\section}{\makeatletter
\renewcommand{\@seccntformat}[1]{{{\csname the##1\endcsname.}}\hspace{1em}}
\makeatother
\@startsection
{section}%           the name
{1}%                 the level
{\z@}%               the indent
{18pt plus 18pt minus 6pt}%  the beforeskip
{6pt}%     the afterskip
{\centering\sectsize\scshape}}% the style
%%
%%
\def\subsection{\renewcommand{\@seccntformat}[1]{{{\csname the##1\endcsname}}\hspace{1em}}
\@startsection
{subsection}%           the name
{2}%                 the level
{\z@}%               the indent
{12pt plus 9pt minus 3pt}%  the beforeskip
{3pt}%     the afterskip
%{\centering\sectsize\itshape}}% the style
{\centering\normalsize\itshape}}% the style%changed AS 30/3/99
%%
%%
%\def\subsubsection{
%\@startsection
%{subsubsection}%           the name
%{3}%                 the level
%{\z@}%               the indent
%{-3.5ex plus -1ex minus -.2ex}%  the beforeskip
%{-1em}%     the afterskip
%{\normalsize\itshape}}% the style

\def\ahead#1{\section{#1}}
\def\bhead#1{\subsection{#1}}
%\def\chead#1{\paragraph{#1}}
\def\abhead#1#2{\section{#1}\subsection{#2}}
\def\aheadx#1{\section*{#1}}
\def\bheadx#1{\subsection*{#1}}

%%%%%%%%%%%%%%%%%%%%%%

%%
%lists etc
\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
      \advance\@enumdepth \@ne
      \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
      {\csname label\@enumctr\endcsname}{\usecounter
        {\@enumctr}\parsep=0pt\leftmargin=24pt
\labelsep=4pt\labelwidth=\leftmargin
\advance\labelwidth-\labelsep\topsep=6pt plus2pt minus2pt\partopsep=0pt
\itemsep=0pt\def\makelabel##1{\hbox to\labelwidth{##1\hss}}}\fi}

\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else
      \advance\@itemdepth \@ne
      \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}\list
      {\csname \@itemitem\endcsname}{\parsep=0pt\leftmargin=24pt
\labelsep=4pt\labelwidth=\leftmargin
\advance\labelwidth-\labelsep\topsep=6pt plus2pt minus2pt\partopsep=0pt
\itemsep=0pt\def\makelabel##1{\hbox to\labelwidth{##1\hss}}}\fi}

%%%%%%%%%%%%%%%%
%Footnotes
%\footnotesep 6pt
\footnotesep 8pt
\def\footnoterule{}
\def\thefootnote{\fnsymbol{footnote}}
\def\@makefnmark{\hbox{$\@thefnmark$}}

\def\@fnsymbol#1{\ifcase#1\or ^{*}\or \dagger\or \ddagger\or \mbox{\S}\or%
    \P\or \|\or ^{**} \or {\dagger}{\dagger}\or {\ddagger}{\ddagger} \else\fi\relax}


\long\def\@makefntext#1{\parindent 1em%
\noindent{\summsize$\m@th{\@thefnmark}$\ #1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Figure and tables

\newdimen{\tempdimen}
\def\visualonly#1% argument = amount of space words are moved up
{\vspace{-#1}\centerline{\huge VISUAL ONLY}\tempdimen#1
\advance\tempdimen by -19pt\vspace{\tempdimen}}

\def\tabline{\\ [-6pt] \hline \\ [-6pt]}
\def\en{\phantom{0}}

\def\tablename{TABLE}

\newlength{\tabwidth}
\newdimen{\figdimen}
\newlength{\keepfeed}

\newdimen{\captspace}
\def\captspace{12pt}

\newdimen{\thistextwidth}
\def\centrelastline#1#2{\thistextwidth #1
 \setbox0=\vbox{{#2}}%
 \setbox0=\vbox{\unvbox0 \setbox1=\lastbox%
 \setbox1=\hbox to \thistextwidth{\hfill\unhbox1\hfill}\box1}%
 \box0}

\def\normalfloatspace{\floatsep 18pt
\textfloatsep 20pt plus 14pt
\intextsep 12pt plus 14pt
}%\maxsep 30pt}
\normalfloatspace

\def\openfloats{\floatsep 24pt
\textfloatsep 32pt plus 14pt
\intextsep 24pt plus 14pt
%\maxsep 42pt
\renewcommand{\floatpagefraction}{.8}}

% this is cline.sty
\def\@clinea{\multispan\@cla&\multispan\@clb
\hspace*{\tabcolsep}\unskip\leaders\hrule \@height \arrayrulewidth
\hfill\hspace*{\tabcolsep}\cr}

\def\tabular{\def\arraystretch{.88}%
 \tabsize\baselineskip=9pt
 \def\@halignto{}\@tabular}

\def\tabstretch#1{\def\tabular{\def\arraystretch{#1}
\tabsize\baselineskip=9pt
 \def\@halignto{}\@tabular}}

\def\tabshrink#1{\def\tabular{\def\arraystretch{#1}
\scriptsize\baselineskip=8pt
 \def\@halignto{}\@tabular}}

\long\def\@caption#1[#2]#3{\par%
   \begingroup
    \@parboxrestore
    \normalsize
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

\long\def\@makecaption#1#2{\vspace{\captspace}{%
 {\summsize\baselineskip=9pt#1.\quad #2}%
}}


\def\setcaption#1#2{\summsize\setbox2=\hbox{#2}\tabwidth\wd2%
\vspace*{3pt}\centerline{\parbox{\wd2}{%
\refstepcounter\@captype \@dblarg{\@tabcaption\@captype}[]{\summsize\textsc{#1}}}}%
\centerline{\box2}}

\def\setnocaption#1{\setbox2=\hbox{#1}\tabwidth\wd2%
\vspace*{3pt}%
\centerline{\box2}}

\long\def\@tabcaption#1[#2]#3{\par
  \begingroup%\@parboxrestore
  \@maketabcaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}

\long\def\@maketabcaption#1#2{\setbox0=\vbox{\summsize
   \baselineskip=9pt#1.\quad\textsc{#2}}%
 \setbox0=\vbox{\unvbox0 \setbox1=\lastbox%
 \setbox1=\hbox to \wd2{\hfill\unhbox1\hfill}%
 \box1}%
 \box0%\endtrivlist
 }

\long\def\@makecaption#1#2{\vspace{\captspace}{
 \setbox0=\vbox{\summsize\baselineskip=9pt#1.\quad #2}%
 \setbox0=\vbox{\unvbox0 \setbox1=\lastbox%
 \setbox1=\hbox to \textwidth{\hfill\unhbox1\hfill}%
 \box1}%
 \box0%\endtrivlist
 }}

\def\tabfoot#1{\vspace{3pt}\par\centerline{%
\parbox{\tabwidth}{\summsize\baselineskip=9pt#1}}}

%%%%%%%%%%%%%%%%%%%%%

\newcommand{\medsp}{\noalign{\vspace{3\p@ plus2\p@ minus1\p@}}}
%\newcommand{\boldarrayrulewidth}{1\p@}

%\def\topline{\noalign{\ifnum0=`}\fi\hrule \@height
%\boldarrayrulewidth \futurelet \@tempa\@xhline}
%\def\@xhline{\ifx\@tempa\hline\vskip \doublerulesep\fi
%\ifnum0=`{\fi}}

% Weighted rules for tables
\newcommand{\toprule}{\medsp\hline\medsp}
\newcommand{\midrule}{\medsp\hline\medsp}
\newcommand{\bottomrule}{\medsp\hline}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% references

\def\references{\aheadx{References}\parindent 0pt
 \footnotesize\baselineskip=9pt
 \vspace{3pt}
 \tabcolsep=4pt\def\arraystretch{1}}

\def\bib#1#2#3{%
\moveleft4pt\hbox{\begin{tabular}{p{123pt}p{22pt}p{222pt}}
\raggedright\parindent=2em\hangindent=2em\noindent\rm\baselineskip=9pt#1 &
\rm\raggedright\noindent\baselineskip=9pt #2 &
\rm\parindent=2em\hangindent=2em\noindent\baselineskip=9pt#3
\end{tabular}\vspace{-1pt}}
}

%Other styles
\def\notes{\runningheads{NOTES AND CORRESPONDENCE}{NOTES AND CORRESPONDENCE}
\renewcommand{\normalsize}{\fontsize{9}{10pt}\selectfont}
\renewcommand{\large}{\fontsize{10.5}{12pt}\selectfont}
\renewcommand{\sectsize}{\fontsize{9}{10pt}\selectfont}
}

\def\review{
\renewcommand{\normalsize}{\fontsize{8.5}{9pt}\selectfont}
\renewcommand{\large}{\fontsize{10.5}{12pt}\selectfont}
\renewcommand{\sectsize}{\fontsize{9}{10pt}\selectfont}
\thispagestyle{qjrms}}

\renewcommand\appendix{\par
\setcounter{section}{0}
\setcounter{subsection}{0}
\setcounter{subsubsection}{0}
\setcounter{equation}{0}
\setcounter{figure}{0}
\setcounter{table}{0}
\def\thesection{\Alph{section}}
\def\theequation{\Alph{section}.\arabic{equation}}
\def\thefigure{\Alph{section}.\arabic{figure}}
\def\thetable{\Alph{section}.\arabic{table}}
}


%%%%%%%%%%%%%%%%%

%Other macros
\def\proc#1{\medbreak\noindent{\it #1}\hspace{1ex}\ignorespaces}
\def\rd{\mbox{\rm d}}
\def\rD{\mbox{\rm D}}
\def\degree{\mbox{\hbox to .25em{}$^\circ$}}
\def\dg{\mbox{$^\circ$}}
\def\mdot{\mbox{\,\raise2pt\hbox{\bf .}}\,}
\def\degC{\degree{}C}
\def\and{{\textup{and}}}
\def\doublespacing{\renewcommand{\baselinestretch}{2}}

\hyphenation{never-the-less}
\hyphenation{atmos-phere atmos-pheric}
\hyphenation{fila-ment}
\hyphenation{kin-etic}
\hyphenation{meso-scale}
\hyphenation{micro-wave}
\hyphenation{par-ameter parame-trize}
\hyphenation{plan-etary}
\hyphenation{spheri-cal}
\hyphenation{reas-on reas-ons}
\hyphenation{for-mula for-mulae for-mulas}
\hyphenation{meteorol}
\hyphenation{thermo-dynamics thermo-dynamic}
\hyphenation{follows}
\hyphenation{atmos radi-ation}
\hyphenation{per-iph-ery}
\hyphenation{meteor-ology meteoro-logi-cal meteor-ol-ogist}
\hyphenation{other-wise}
\hyphenation{down-slope}
\hyphenation{wave-guide wave-guides}
\hyphenation{extra-tropical}

\thinmuskip = 4mu
\medmuskip = 4mu
\thickmuskip = 4mu
