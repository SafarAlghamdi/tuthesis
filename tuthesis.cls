%% tuthesis Class for LaTeX2e.
% This file contains thesis specification set by Taif University
% The file was based on the class: muthesis
% developed by Dr. Faisal Al-Malki (falmalki@tu.edu.sa)
% First draft Released on : 18 / 2 / 2017

\ProvidesClass{tuthesis}

\DeclareOption{singlespace}{\singlesp@true}
\DeclareOption{doublespace}{\doublesp@true}
\DeclareOption{PhD}{\def\degreetitle{Doctor of Philosophy}}
\DeclareOption{MSc}{\def\degreetitle{Master of Science}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ExecuteOptions{MSc}

\ProcessOptions
\RequirePackage{multicol}

\LoadClass[a4paper]{report}

%% Specify >15mm  margins except on the binding edge, where it is >40mm
\oddsidemargin 14.6truemm \evensidemargin 0truemm
\marginparwidth 40pt \marginparsep 10pt
\topmargin 0truemm \headsep 10truemm
\textheight 224truemm \textwidth 145truemm

%% Disallow page breaks at hyphens (this will give some underfull vbox's,
%% so an alternative is to use \brokenpenalty=100 and manually search
%% for and fix such page breaks)
\brokenpenalty=10000

%% Set up line spacing
%\AtBeginDocument{%
%\ifdoublesp@%
%  \doublespacing%
%\else\ifsinglesp@%
%  \singlespacing%
%\else%
%  \onehalfspacing%
%\fi%
%\fi
%}

\def\dept#1{\gdef\@dept{#1}}
\def\school#1{\gdef\@dept{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\degreefield#1{\gdef\@degreefield{#1}}

%%%%%% Supervisors  %%%%%%
\newif\if@CoSupervisor   \@CoSupervisorfalse
\def\supervisor#1{\gdef\@supervisor{#1}}
\def\SupervisorDegree#1{\gdef\@SupervisorDegree{#1}}
\def\CoSupervisor#1{\gdef\@CoSupervisor{#1}\@CoSupervisortrue}
\def\CoSupervisorDegree#1{\gdef\@CoSupervisorDegree{#1}}
\def\submitdate#1{\gdef\@submitdate{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}} % \author, \title in report
\def\@title{}\def\@author{}
\def\@dept{Department of Mathematics \& Statistics}
\def\@faculty{Sciences}
\def\@degreefield{}
\def\@submitdate{\number\the\year}

\newif\ifcopyright \newif\iffigurespage \newif\iftablespage \newif\ifsigpage
\copyrighttrue \figurespagetrue \tablespagetrue \sigpagefalse


\def\titlep{%
\setlength\headheight{26pt}
\lhead{\large Taif University \\
Faculty of Sciences \\
Department of Mathematics \& Statistics}
\rhead{\includegraphics[width=2.5cm]{TU}}
\pagenumbering{gobble}% Remove page numbers (and reset to 1)
\thispagestyle{fancy}

  \null\vskip1in%

  \begin{center}
    \Huge\uppercase\expandafter{\@title}
  \end{center}
  \vfill
  \begin{center}
    \textsc{A thesis submitted by \\ \vskip.25in
    \textbf{\@author}\\ \vskip.25in
    in partial fulfillment of the requirements \\
    for the degree of \degreetitle  \; in \@degreefield }
  \end{center}
  \vfill
 \if@CoSupervisor
   \begin{center}
    \normalfont Supervisors\\ \vskip.25in

 \begin{minipage}[b]{.4\textwidth}
   \textbf{ \@supervisor}\\
   \textbf{\@SupervisorDegree}
\end{minipage}
\hfill
\begin{minipage}[b]{0.4\textwidth}
   \textbf{ \@CoSupervisor}\\
   \textbf{\@CoSupervisorDegree}
\end{minipage}
  \end{center}
   \else
  \begin{center}
    \normalfont Supervisor\\ \vskip.25in
   \textbf{ \@supervisor}\\
   \textbf{\@SupervisorDegree}
  \end{center}
 \fi
    \vfill
  \begin{center}
    \@submitdate
  \end{center}\vskip.5in
  \newpage
}

\def\abstracttitle{%
  \begin{center}
    \large
    \expandafter{\@title}\\
    \@author\\
    A thesis submitted to Taif University\\
    for the degree of \degreetitle\\
    \@submitdate
  \end{center}
}

\def\copyrightpage{%
\prefacesection{Copyright}

\begin{enumerate}
\item[i.]

  The author of this thesis (including any appendices and/or schedules
  to this thesis) owns any copyright in it (the ``Copyright'')
  and s/he has given Taif University the right to use
  such Copyright for any administrative, educational
  and/or teaching purposes.

\item[ii.]  Copies of this thesis, either in full or in extracts, may be
  made only in accordance with the regulations of Taif
  University Library. Details of these regulations may
  be obtained from the Librarian. This page must form part of any such
  copies made.

\item[iii.] Further information on the conditions under which disclosure,
  publication and exploitation of this thesis, the Copyright and any
  Intellectual Property Rights and/or Reproductions described in it
  may take place is available from the the deanship of graduate studies.
\end{enumerate}

\vfill\newpage}

\def\declpage{%
\prefacesection{Declaration}
        \begin{center}
        \begin{minipage}{4in}
                \parindent=0pt
                No portion of the work referred to in this thesis has been
                submitted in support of an application for another degree or
                qualification of this or any other university or other
                institute of learning.
                \par
        \end{minipage}%
        \end{center}%
        \vfill}

\def\beforeabstract{
        \pagestyle{plain}
        \titlep
                \pagenumbering{arabic}
        \ifsigpage\signaturepage\fi
        \tableofcontents \vfill\noindent Word count: \wordcount
        \newpage
        \iftablespage
                \addvspace{10pt}
                \listoftables
                \newpage
        \fi
        \iffigurespage
                \addvspace{10pt}
                \listoffigures
                \newpage
        \fi}

\def\afterabstract{
        \newpage
        \declpage
        \ifcopyright\copyrightpage\fi % moved to conform with 95 regs
        }

\def\prefacesection#1{%
        \chapter*{#1}
        \addcontentsline{toc}{chapter}{#1}}

\def\afterpreface{\newpage
        \pagestyle{plain}}

\pagestyle{plain}

\def\thebibliography#1{\chapter*{\bibname\@mkboth
  {\uppercase{\bibname}}{\uppercase{\bibname}}}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \list
  {\@biblabel{\arabic{enumiv}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \def\theenumiv{\arabic{enumiv}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=\@m}

\def\endthebibliography{%
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}%
  \endlist}
