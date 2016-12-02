\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cgsthesis}[10/10/2012 CGS Thesis class by J.E. Kyprianidis]

\newif\ifcgs@tight
\newif\ifcgs@afoursmall
\newif\ifcgs@basic
\newif\ifcgs@tenpt
\newif\ifcgs@nofonts
\newif\ifcgs@palatino
\newif\ifcgs@utopia
\newif\ifcgs@charter
\newif\ifcgs@times
\newif\ifcgs@timesNR
\newif\ifcgs@libertine

\DeclareOption{tight}{\cgs@tighttrue}
\DeclareOption{a4small}{\cgs@afoursmalltrue}
\DeclareOption{basic}{\cgs@basictrue}
\DeclareOption{10pt}{\cgs@tenpttrue}
\DeclareOption{nofonts}{\cgs@nofontstrue}
\DeclareOption{palatino}{\cgs@palatinotrue}
\DeclareOption{utopia}{\cgs@utopiatrue}
\DeclareOption{charter}{\cgs@chartertrue}
\DeclareOption{libertine}{\cgs@libertinetrue}
\DeclareOption{times}{\cgs@timestrue}
\DeclareOption{timesNR}{\cgs@timesNRtrue}
\ProcessOptions\relax

\IfFileExists{cgsthesis.cfg}{\input{cgsthesis.cfg}}

\ifcgs@tenpt
    \LoadClass[fontsize=10pt,chapterprefix=true,headsepline=true,
               bibliography=totoc,listof=totoc]{scrbook}
    \let\latex@xfloat=\@xfloat
    \def\@xfloat #1[#2]{%
        \latex@xfloat #1[#2]%
        \linespread{1.0999}\selectfont}
    %\linespread{1.1333}\selectfont
    \linespread{1.1666}\selectfont
    \newcommand{\cgs@width}{5.25in}
\else
    \LoadClass[fontsize=11pt,chapterprefix=true,headsepline=true,
               bibliography=totoc,listof=totoc]{scrbook}
    \let\latex@xfloat=\@xfloat
    \def\@xfloat #1[#2]{%
        \latex@xfloat #1[#2]%
        \linespread{1.0666}\selectfont}
    \linespread{1.0666}\selectfont
    \newcommand{\cgs@width}{147mm}
\fi

\RequirePackage{scrhack}
\RequirePackage{scrpage2}
\RequirePackage{babel}
\RequirePackage{amsmath,amsthm}
\RequirePackage{printlen}

\newcommand{\cgs@dispfamily}{\sffamily}

\ifcgs@nofonts\else
\ifcgs@timesNR
    \RequirePackage{microtype}
    \RequirePackage[T1]{fontenc}
    \RequirePackage[optima,lucida]{jtimesnew}
    \RequirePackage[mtphrb,mtpccal,mtpscr,subscriptcorrection]{mtpro2}
\else
\ifcgs@palatino
    \RequirePackage{microtype}
    \RequirePackage[T1]{fontenc}
    \RequirePackage[scaled=1.03]{inconsolata}
    \RequirePackage[osf]{mathpazo}
    \renewcommand*\sfdefault{uop} %http://www.ctan.org/tex-archive/fonts/urw/classico/
\else
\ifcgs@utopia
    \RequirePackage{microtype}
    \RequirePackage[scaled=0.92]{helvet}
    \RequirePackage[utopia,ttscaled=false]{mathdesign}
    \RequirePackage{inconsolata}
\else
\ifcgs@charter
    \RequirePackage{microtype}
    \RequirePackage[charter,ttscaled=false]{mathdesign}
    \RequirePackage[scaled]{berasans}
    \RequirePackage{inconsolata}
\else
\ifcgs@times
    \RequirePackage{microtype}
    \RequirePackage[T1]{fontenc}
    \RequirePackage{newtxtext}
    \RequirePackage{newtxmath}
    \let\mathscr\mathcal
\else
\ifcgs@libertine
    \RequirePackage[T1]{fontenc}
    \RequirePackage[nf]{libertine}
    \RequirePackage[scaled=.85]{beramono}
    \RequirePackage[libertine,cmintegrals,cmbraces]{newtxmath}
    \renewcommand*{\rmdefault}{fxlj}
    \def\libertine{\fontfamily{fxlj}\selectfont}
    \let\mathscr\mathcal
\else
    \RequirePackage{microtype}
    \RequirePackage[T1]{fontenc}
    \RequirePackage{lmodern}
    \RequirePackage{inconsolata}
    \RequirePackage{amsfonts}
    \RequirePackage{mathrsfs}
\fi\fi\fi\fi\fi\fi\fi

\ifcgs@basic\else
\RequirePackage{textcomp}
\RequirePackage{math tools}
\RequirePackage{graphicx}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[hyphens]{url}
\RequirePackage[colorlinks=true,citecolor=Blue,linkcolor=Black,urlcolor=Blue,bookmarks=false]{hyperref}
\RequirePackage{xspace}
\RequirePackage{afterpage}
\RequirePackage[normalem]{ulem}
\RequirePackage{csquotes}
\RequirePackage[shortcuts]{extdash}
\RequirePackage{booktabs}
\RequirePackage{listings}
\RequirePackage[capitalise,noabbrev,nameinlink]{cleveref}
\RequirePackage[normal,labelfont=bf,textfont=it,font=small]{caption}
\captionsetup[figure]{skip=\medskipamount,belowskip=-7pt}
\captionsetup[table]{skip=\medskipamount,belowskip=-7pt}
\RequirePackage[labelformat=simple,labelfont=md,textfont=it,font=scriptsize,
                skip=\medskipamount,belowskip=0pt,justification=centering]{subcaption}
\renewcommand\thesubfigure{(\alph{subfigure})}
\advance\textfloatsep 8pt
\def\lst@MakeCaption#1{% #1 is `t' or `b'
  \begingroup
  %\ifdim\hsize>\linewidth
  %  \hsize\linewidth
  %\fi
    \caption@setposition{#1}%
    \caption@iftop{%
      \@tempdima\belowcaptionskip
      \belowcaptionskip\abovecaptionskip
      \abovecaptionskip\@tempdima}{}%
    \caption@setup{rule=0}%
    \caption@setoptions{lstlisting}%
    \caption@setautoposition{#1}%
    \caption@begin{lstlisting}%
      \caption@ORI@lst@MakeCaption{#1}%
    \caption@end
  \endgroup}%
\fi

\topskip=\baselineskip
\ifcgs@tight
    \RequirePackage[papersize={6.5in,10in},
                text={\cgs@width,220mm},centering,
                head=14pt,headsep=16pt,foot=27pt]{geometry}
\else\ifcgs@afoursmall
    \RequirePackage[papersize={21cm,11in},
                text={\cgs@width,220mm},top=27mm,hcentering,
                head=14pt,headsep=16pt,foot=27pt]{geometry}
\else
    \RequirePackage[a4paper, %papersize={21cm,11in},
                text={\cgs@width,220mm},top=34mm,hcentering,
                head=14pt,headsep=16pt,foot=27pt]{geometry}
\fi\fi
\setlength\parindent{2em}
\setlength{\headheight}{1.1\baselineskip}
%\parskip=2pt plus 2pt minus 1pt

\addtokomafont{disposition}{\cgs@dispfamily}
\renewcommand{\chapterformat}{\chapappifchapterprefix{\space}\thechapter\enskip}
\renewcommand{\size@chapter}{\Huge}
\renewcommand{\size@chapterprefix}{\large}
\renewcommand{\chapterheadstartvskip}{\vspace*{50\p@}}
\renewcommand{\chapterheadendvskip}{\vskip40pt}
\renewcommand*{\@@makechapterhead}[1]{\chapterheadstartvskip
  {%
    \setlength{\parindent}{\z@}\setlength{\parfillskip}{\fill}%
    \normalfont\sectfont\nobreak\size@chapter{}%
    \if@chapterprefix
      \let\@tempa\raggedsection
    \else
      \let\@tempa\@hangfrom
    \fi
    \@tempa{\ifnum \c@secnumdepth >\m@ne%
        \if@mainmatter
          \if@chapterprefix
            \expandafter\size@chapterprefix
          \else
            \expandafter\size@chapter
          \fi
          {\chapterformat}%
          \if@chapterprefix
            \size@chapterprefix{}\endgraf\nobreak
          \fi
        \fi
      \fi
    }%
    {\raggedsection \interlinepenalty \@M \size@chapter{#1}\par}}%
  \nobreak\chapterheadendvskip
}
\renewcommand*{\@@makeschapterhead}[1]{%
  \chapterheadstartvskip%
  {\normalfont\sectfont\nobreak\size@chapter{}%
    \setlength{\parindent}{\z@}\setlength{\parfillskip}{\fill}%
    \centering \interlinepenalty\@M \size@chapter{#1}\par}%
  \nobreak\chapterheadendvskip%
}
\setkomafont{pageheadfoot}{\cgs@dispfamily\footnotesize}
\pagestyle{scrheadings}
\clearscrheadfoot
\ihead{\headmark}
\ohead{\pagemark}
\cfoot[\pagemark]{}
\setheadsepline{.4pt}
\renewcommand*{\chaptermarkformat}{\chapappifchapterprefix{\ }\thechapter. \ }
\renewcommand*{\sectionmarkformat}{\thesection. \ }
\renewcommand*{\subsectionmarkformat}{\thesubsection. \ }

\setkomafont{dictumtext}{\itshape\small}
\setkomafont{dictumauthor}{\normalfont}
\renewcommand*\dictumwidth{0.6\linewidth}
\renewcommand*\dictumauthorformat[1]{--- #1}
\renewcommand*\dictumrule{}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
  {1.5ex \@plus0.5ex \@minus0.5ex}%
  {-1em}%
  {\raggedsection\normalfont\sectfont\nobreak\size@paragraph}%
}

\gdef\@logo{}
\def\logo#1{\gdef\@logo{#1}}

\gdef\@date{%
    \ifcase\month
    \or Januar%
    \or Februar%
    \or M{\"a}rz%
    \or April%
    \or Mai%
    \or Juni%
    \or Juli%
    \or August%
    \or September%
    \or Oktober%
    \or November%
    \or Dezember%
    \fi\space\number\year}
\gdef\@place{Potsdam}
\def\place#1{\gdef\@place{#1}}

\renewcommand\maketitle{
    \begin{titlepage}
        \centering\large\sffamily%
        \ifx\@logo\@empty
        \else
            \makebox[\textwidth]{\includegraphics{\@logo}}
        \fi
        \vfill
        {\Huge\textbf{\@title}\par}
        \ifx\@subtitle\@empty
        \else
            \vskip 2ex
            {\Large\textbf{\@subtitle}\par}
        \fi
        \vfill
        {\@subject\par}
        {\Large\textbf{\@author}\par}
        \ifx\@publishers\@empty
        \else
        {\vfill\@publishers\par}
        \fi
        {\normalsize\vfill
        \@place,\\
        \@date\par}
    \end{titlepage}}
