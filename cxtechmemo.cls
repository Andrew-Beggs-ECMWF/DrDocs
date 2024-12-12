%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECMWF Latex Class           %
% LaTeX Template FORMATTING   %
% Created by Timothy Revell   %
% On 18/01/16                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cxtechmemo.cls}

\LoadClass{report}
\RequirePackage[top=4cm,bottom=3cm,left=2cm,right=2cm,headsep=10pt,a4paper]{geometry} %Margins for pages

\RequirePackage{graphicx} %For including pictures
\RequirePackage{lipsum} %Dummy text
\RequirePackage{tikz} %Drawings
\RequirePackage[english]{babel} %English lang and hyphenation
\RequirePackage{hyperref} %Hyperlinks

%Lists
\RequirePackage{enumitem} % Customise lists
%\setlist{nolistsep} %Uncomment to Reduce space between bullet points and numbered lists
\renewcommand{\labelitemi}{\color{grey}$\bullet$}% Custom bullet point
\setlist[itemize]{leftmargin=*} %Get's rid of indents for lists
\setlist[enumerate]{leftmargin=*} %Get's rid of indents for lists


\RequirePackage{booktabs} %Nicer horizontal rules in tables

%Colours
\RequirePackage{xcolor} %Specify colours
\definecolor{turq}{RGB}{77,189,220} %Define ECMEF Turquouise
\definecolor{grey}{RGB}{185,185,185} %Define ECMEF grey

%Grey lines in tables
\RequirePackage{colortbl}
\arrayrulecolor{grey}



\RequirePackage{fontspec}
\setmainfont{Verdana} 
\newfontfamily\verd{Verdana} %Font Verdana



\RequirePackage{calc} % For spacing the headings correctly

%Captions
\RequirePackage[font={color=gray},justification=justified,singlelinecheck=false]{caption}

%Figures just single number
\makeatletter
\renewcommand*{\thetable}{\arabic{table}}
\renewcommand*{\thefigure}{\arabic{figure}}
\let\c@table\c@figure
\makeatother 


%Columns
\RequirePackage{multicol}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% DOCUMENT INFO %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Report Name
\newcommand{\ReportName}[1]{\def\RN{#1 \\[0.5em]}\def\SRN{#1}}
\ReportName{\hfill}


%Short Report Name
\newcommand{\ShortReportName}[1]{\def\SRN{#1 |}}  
\ShortReportName{\hspace}
 
%Subtitle 1
\newcommand{\SubtitleOne}[1]{\def\SO{#1}}
\SubtitleOne{\hfill}

%Subtitle 2
\newcommand{\SubtitleTwo}[1]{\def\ST{#1\\[0.5em]}}
\SubtitleTwo{\hfill}

%Subtitle 3
\newcommand{\SubtitleThree}[1]{\def\STR{#1\\[0.5em]}}
\SubtitleThree{\hfill}

%Subtitle 4
\newcommand{\SubtitleFour}[1]{\def\SF{#1}}
\SubtitleFour{\hfill}

%Issued by
\newcommand{\IssuedBy}[1]{\def\IB{#1\\[0.5em]}}
\IssuedBy{\hfill}

%Date of report
\newcommand{\ReportDate}[1]{\def\RD{#1\\[0.4em]}}
\ReportDate{\hfill}

%Reference 
\newcommand{\Reference}[1]{\def\RE{#1}}
\Reference{\hfill}

%%%For use on back page%%%

%Contact Email 
\newcommand{\contactEmail}[1]{\def\CE{#1\\}}
\contactEmail{\hfill}

%Contact Address
\newcommand{\contactAddress}[1]{\def\CA{#1\\}}%Change if needed
\contactAddress{\hfill}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TOC
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{titletoc} % To manipulate table of contents

\contentsmargin{0cm} %Get rid off default margin



% Sections
\titlecontents{section}[7cm] % Indentation
{\addvspace{6pt}\fontsize{11pt}{11pt}\sffamily\mdseries \verd} % Spacing and font options for chapters
{\color{grey}\contentslabel[\fontsize{11pt}{11pt} \verd \thecontentslabel]{1.25cm}\color{grey}} % Chapter number
{\color{grey}}  
{\color{grey}\fontsize{11pt}{11pt} \verd \hfill \thecontentspage \hspace{1.5cm}} % Page number

\setcounter{tocdepth}{1} %Stops anything below section


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HEADERS AND FOOTERS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr} %To manipulate headers/footers

%Plain
\fancypagestyle{plain}{
\rhead{}\lhead{}\chead{} \cfoot{}
\lfoot{\color{grey}\SRN}
\rfoot{\color{grey} \thepage}
\renewcommand{\footrulewidth}{0.2pt}
\renewcommand{\footrule}{\hbox to\headwidth{%
   \color{grey}\leaders\hrule height \footrulewidth\hfill}}} % Style for when a plain pagestyle is specified
   



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%HEADINGS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\thesection}{\arabic{section}}
\setcounter{secnumdepth}{4}

\RequirePackage{titlesec}

\titleformat{\section}
  {\normalfont\fontsize{14pt}{14pt}\bfseries\color{grey}}   %Style
  {\thesection .}      %Prefix
  {0.5em}   %Space between prefix and title
  {}      %How section is represented
  
\titleformat{\subsection}
  {\normalfont\large\bfseries\color{grey}}   %Style  
  {\thesubsection .}      %Prefix
  {0.5em}   %Space between prefix and title
  {}      %How section is represented
  
\titleformat{\subsubsection}
  {\normalfont\large\bfseries\color{turq}}   %Style  
  {\thesubsubsection .}      %Prefix
  {0.5em}   %Space between prefix and title
  {}      %How section is represented



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%IMAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\makeatletter
\newlength\esp
\setlength\esp{4pt}
\newlength\ecart
\setlength\ecart{1.2cm-\esp}
\newcommand{\thepartimage}{}%
\newcommand{\partimage}[1]{\renewcommand{\thepartimage}{#1}}%
\def\@part[#1]#2{%
\ifnum \c@secnumdepth >-2\relax%
\refstepcounter{part}%
\addcontentsline{toc}{part}{\texorpdfstring{\protect\@mypartnumtocformat{\thepart}{#1}}{\partname~\thepart\ ---\ #1}}
\else%
\addcontentsline{toc}{part}{\texorpdfstring{\protect\@myparttocformat{#1}}{#1}}%
\fi%
\startcontents%
\markboth{}{}%
{\thispagestyle{fancy}%
\begin{tikzpicture}[remember picture,overlay]%
\node at (current page.north west){\begin{tikzpicture}[remember picture,overlay]%	
\fill[grey](0cm,0cm) rectangle (\paperwidth,-\paperheight);
\node[anchor=north] at (4cm,-3.25cm){\color{grey}\fontsize{220}{100}\sffamily\bfseries\@Roman\c@part}; 
\node[anchor=south east] at (\paperwidth-1cm,-\paperheight+1cm){\parbox[t][][t]{8.5cm}{
\printcontents{l}{0}{\setcounter{tocdepth}{1}}%
}};
\node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{white}\fontsize{30}{30}\sffamily\bfseries#2}};
\end{tikzpicture}};
\end{tikzpicture}}%
\@endpart}
\def\@spart#1{%
\startcontents%
\phantomsection
{\thispagestyle{fancy}%
\begin{tikzpicture}[remember picture,overlay]%
\node at (current page.north west){\begin{tikzpicture}[remember picture,overlay]%	
\fill[grey](0cm,0cm) rectangle (\paperwidth,-\paperheight);
\node[anchor=north east] at (\paperwidth-1.5cm,-3.25cm){\parbox[t][][t]{15cm}{\strut\raggedleft\color{white}\fontsize{30}{30}\sffamily\bfseries#1}};
\end{tikzpicture}};
\end{tikzpicture}}
\addcontentsline{toc}{part}{\texorpdfstring{%
\setlength\fboxsep{0pt}%
\noindent\protect\colorbox{grey}{\strut\protect\parbox[c][.7cm]{\linewidth}{\Large\sffamily\protect\centering #1\quad\mbox{}}}}{#1}}%
\@endpart}
\def\@endpart{\vfil\newpage
\if@twoside
\if@openright
\null
\thispagestyle{fancy}%
\newpage
\fi
\fi
\if@tempswa
\twocolumn
\fi}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%CHAPTER IMAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\thechapterimage}{}%
\newcommand{\chapterimage}[1]{\renewcommand{\thechapterimage}{#1}}%
\def\@makechapterhead#1{%
{\parindent \z@ \raggedright \normalfont
\ifnum \c@secnumdepth >\m@ne
\if@mainmatter
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
\draw[anchor=west] (\Gm@lmargin,-9cm) node {\strut\makebox[22cm]{}};
\draw[anchor=west] (\Gm@lmargin+.-0.15cm,-5cm) node {\Huge\sffamily\bfseries\color{grey}#1\strut}; %Adjust for chapter
\end{tikzpicture}};
\end{tikzpicture}
\else
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
\draw[anchor=west] (\Gm@lmargin,-9cm) node {\strut\makebox[22cm]{}};
\draw[anchor=west] (\Gm@lmargin+.3cm,-5cm) node {\huge\sffamily\bfseries\color{grey}#1\strut};
\end{tikzpicture}};
\end{tikzpicture}
\fi\fi\par\vspace*{60\p@}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\@makeschapterhead#1{%
\begin{tikzpicture}[remember picture,overlay]
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{\thechapterimage}};
\draw[anchor=west] (\Gm@lmargin,-9cm) node {\strut\makebox[22cm]{}};
\draw[anchor=west] (\Gm@lmargin+.3cm,-5cm) node {\Large\sffamily\bfseries\color{grey} #1\strut}; %Adjust for height of contents and "contents" text
\end{tikzpicture}};
\end{tikzpicture}
\par\vspace*{40\p@}} %Adjust for gap between contents and entries
\makeatother


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        TITLE PAGE           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\frontpage}{%
\clearpage
\begingroup
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
\coordinate [below=11.3cm] (midpoint) at (current page.north);
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
%CM \node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{Formatting/background}}; % Background image
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{cx_background}}; % Background image
\draw[anchor=north] (midpoint) node {\hspace{-1cm} \parbox[c][][t]{0.6\paperwidth}{\vspace{0cm} 
{\Huge\bfseries \verd \RN \SO}
}}; %Address and Email
\draw[anchor=north] (midpoint) node {\hspace{-1cm} \parbox[c][][t]{0.6\paperwidth}{\vspace{5cm} 
{\fontsize{18pt}{25pt} \bfseries \verd \ST \STR \SF}
}}; %Subtitles
\draw[anchor=north] (midpoint) node {\hspace{-1cm} \parbox[c][][t]{0.6\paperwidth}{\vspace{10cm} 
{\fontsize{11pt}{11pt} \mdseries \verd \IB \RD \RE}
}}; %Address and Email
\end{tikzpicture}};
\end{tikzpicture}
\vfill
\endgroup
}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         BACKPAGE            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\backpage}{
\clearpage
\begingroup
\thispagestyle{empty}
\begin{tikzpicture}[remember picture,overlay]
\coordinate [below=24cm] (midpoint) at (current page.north);
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
%CM \node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{Formatting/backpage}}; % Background image
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{cx_backpage}}; % Background image
\draw[anchor=north] (midpoint) node {\Huge\bfseries\sffamily\hspace{5cm} \parbox[c][][t]{\paperwidth}{\vspace{0cm} 
{\large  \mdseries \verd \color{white} \CA Contact: \CE}
}}; %Address and Email
\end{tikzpicture}};
\end{tikzpicture}
\vfill
\endgroup
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    TABLE OF CONTENTS        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\tableOfContents}{
%CM \chapterimage{Formatting/toc.pdf} % Table of contents image
\chapterimage{cx_toc.pdf} % Table of contents image

% FOOTERS
\pagestyle{fancy} % Show Footers
\rhead{}\chead{} \cfoot{} \lhead{}

% FOOTER CUSTOMISATION
\lfoot{\color{grey}\SRN}
\rfoot{\color{grey} \thepage}
\renewcommand{\footrulewidth}{0.2pt}
\renewcommand{\footrule}{\hbox to\headwidth{%
   \color{grey}\leaders\hrule height \footrulewidth\hfill}}

% HEADER 
\renewcommand{\headrule}{
\begin{tikzpicture}[remember picture,overlay]
\coordinate [below=11.5cm] (midpoint) at (current page.north);
\node at (current page.north west)
{\begin{tikzpicture}[remember picture,overlay]
%CM \node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{Formatting/chapter}};
\node[anchor=north west,inner sep=0pt] at (0,0) {\includegraphics[width=\paperwidth]{cx_chapter}};
\end{tikzpicture}};
\end{tikzpicture}}


\tableofcontents %Print table of contents
\clearpage

\chapterimage{Formatting/chapter.pdf}

\setcounter{chapter}{1}}

\AtBeginDocument{\frontpage \tableOfContents}

\AtEndDocument{\backpage}



