%
% Template:
%   - name: myarticle
%   - category: article
%   - date: 2017-10-13 10:53:19 -0400
%   - commit: a88d655695042b8725089ecaea0e8e6a14b1f4a4
%
% Copyright (C) 2014-2017 by Xu Cheng <xucheng@me.com>
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%    http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Xu Cheng.
%

\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{myarticle}

\RequirePackage{xifthen}
\RequirePackage{xkeyval}
\RequirePackage{xkvltxp}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptionsX%
\LoadClass[a4paper]{article}

% Check for obsoleted LaTeX packages
\RequirePackage[l2tabu,orthodox]{nag}

% Utility packages
\RequirePackage{datenumber}
\RequirePackage{etoolbox}
\RequirePackage{iftex}
\RequirePackage{ragged2e}
\RequirePackage{xparse}
\RequirePackage{xpatch}
\RequirePackage{xstring}

% Font setting
\ifLuaTeX%
    \RequirePackage{fontspec}
    \setmainfont[Ligatures={Common,TeX}]{Tex Gyre Termes}
    \setsansfont[Ligatures={Common,TeX}]{Helvetica Neue}
    \setmonofont{CMU Typewriter Text}
    \defaultfontfeatures{Scale=MatchLowercase}
\else%
    \RequirePackage{newtxtext}
    \RequirePackage[T1]{fontenc}
    \RequirePackage{textcomp}
\fi%

% Paper size setting
\ifthenelse{\isnamedefined{pagewidth}}{
    \pagewidth=\paperwidth%
    \pageheight=\paperheight%
}{
    \ifthenelse{\isnamedefined{pdfpagewidth}}{
        \pdfpagewidth=\paperwidth%
        \pdfpageheight=\paperheight%
    }{}
}

% Indent of paragraph and skip between paragraphs
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt plus 2pt}

% Color packages
\RequirePackage{color}
\RequirePackage[table,dvipsnames]{xcolor}

% hyperref setting
\RequirePackage[unicode]{hyperref}
\definecolor{@hyperreflinkred}{RGB}{128,23,31}
\hypersetup{
    bookmarksnumbered=true,
    bookmarksopen=true,
    bookmarksopenlevel=3,
    colorlinks=true,
    allcolors=@hyperreflinkred,
    pdfinfo={
        Template.name={myarticle},
        Template.author={Xu Cheng <xucheng@me.com>},
        Template.category={article},
        Template.date={2017-10-13 10:53:19 -0400}, % chktex 8
        Template.commit={a88d655695042b8725089ecaea0e8e6a14b1f4a4},
        Template.url={https://github.com/xu-cheng/latex},
    },
    linktoc=page,
    plainpages=false,
    pdfstartview={XYZ null null 1},
    pdfpagemode={UseOutlines},
    pdfpagelayout={OneColumn}
}
\RequirePackage{bookmark}

% Math related packages
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{mathrsfs}
\RequirePackage{latexsym}
\RequirePackage{bm}
\RequirePackage{fancynum}
\setfnumgsym{\,}
\RequirePackage[ruled,vlined]{algorithm2e}
\SetVlineSkip{0pt}

% Caption related packages
\RequirePackage{caption}
\RequirePackage{subcaption}

% Figure related packages
\RequirePackage{graphicx}
\RequirePackage{tikz}
\RequirePackage{overpic}

% Table related packages
\RequirePackage{array}
\RequirePackage{tabu}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

% Equation style
\allowdisplaybreaks[4]
\numberwithin{equation}{section}

% Skip between equation and context
% Ref: https://tex.stackexchange.com/a/69678
\def\@setdisplayskip{
    \abovedisplayskip=0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip % chktex 1
    \abovedisplayshortskip=0pt plus 0.25\baselineskip % chktex 1
    \belowdisplayskip=0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip % chktex 1
    \belowdisplayshortskip=0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip % chktex 1
}
\xapptocmd\Huge{\@setdisplayskip}{}{}
\xapptocmd\huge{\@setdisplayskip}{}{}
\xapptocmd\LARGE{\@setdisplayskip}{}{}
\xapptocmd\Large{\@setdisplayskip}{}{}
\xapptocmd\large{\@setdisplayskip}{}{}
\xapptocmd\normalsize{\@setdisplayskip}{}{}
\xapptocmd\small{\@setdisplayskip}{}{}
\xapptocmd\footnotesize{\@setdisplayskip}{}{}
\xapptocmd\scriptsize{\@setdisplayskip}{}{}
\xapptocmd\tiny{\@setdisplayskip}{}{}

% Caption style
\DeclareCaptionLabelFormat{@caplabel}{#1~#2}
\captionsetup{
    labelformat=@caplabel,
    format=hang,
    labelsep=quad,
    skip=0.5\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip% chktex 1
}

% Utility function
\RequirePackage{soul} % offers \hl
\def\email#1{
    \href{mailto:#1}{\texttt{#1}}
}
\long\def\eat#1{}
\long\def\todo#1{
    {\color{red} TODO:\ #1}
}
% Page geometry
\RequirePackage{geometry}
\geometry{
    a4paper,
    top=3cm,
    bottom=3cm,
    left=2.5cm,
    right=2.5cm
}

% Load more packages
\RequirePackage{tabularx}
\RequirePackage{ltxtable}
\RequirePackage[inline]{enumitem}
\RequirePackage[compact]{titlesec}
\RequirePackage{titletoc}
\RequirePackage{tocvsec2}
\RequirePackage{fancyhdr}
\RequirePackage{afterpage}
\RequirePackage{appendix}
\RequirePackage[titles]{tocloft}

% Variables setting
\def\title#1{\gdef\@title{#1}\hypersetup{pdftitle={#1}}}
\title{}

\def\author#1{\gdef\@author{#1}\hypersetup{pdfauthor={#1}}}
\author{}


% Section & TOC style
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{1}
\contentsmargin{2.0em}

\titleformat*{\section}{\Large\bfseries}
\titleformat*{\subsection}{\large\bfseries}
\titleformat*{\subsubsection}{\large\bfseries}

\newskip\@oldcftbeforesecskip
\@oldcftbeforesecskip=\cftbeforesecskip%
\newskip\@oldcftbeforesubsecskip
\@oldcftbeforesubsecskip=\cftbeforesubsecskip%
\xapptocmd{\l@section}{
    \ifthenelse{\value{tocdepth} > 1}{\cftbeforesecskip=0.25\baselineskip}{}
}{}{}
\xapptocmd{\l@subsection}{
    \ifthenelse{\value{tocdepth} > 1}{\cftbeforesecskip=\@oldcftbeforesecskip}{}
    \ifthenelse{\value{tocdepth} > 2}{\cftbeforesubsecskip=0.25\baselineskip}{}
}{}{}
\xapptocmd{\l@subsubsection}{
    \ifthenelse{\value{tocdepth} > 2}{\cftbeforesubsecskip=\@oldcftbeforesubsecskip}{}
}{}{}

\renewcommand*\cftfigpresnum{\figurename~}
\newlength{\@cftfignumwidth@tmp}
\settowidth{\@cftfignumwidth@tmp}{\cftfigpresnum}
\addtolength{\cftfignumwidth}{\@cftfignumwidth@tmp}
\renewcommand{\cftfigaftersnumb}{\quad~}
\renewcommand*\cfttabpresnum{\tablename~}
\newlength{\@cfttabnumwidth@tmp}
\settowidth{\@cfttabnumwidth@tmp}{\cfttabpresnum}
\addtolength{\cfttabnumwidth}{\@cfttabnumwidth@tmp}
\renewcommand{\cfttabaftersnumb}{\quad~}

% Head & Foot style
\let\ps@plain\ps@fancy
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[C]{\thepage}

% List style
\setlist{noitemsep,partopsep=0pt,topsep=.8ex}
\setlist[1]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*.,ref=\arabic*}
\setlist[enumerate,2]{label*=\arabic*,ref=\theenumi.\arabic*}
\setlist[enumerate,3]{label=\emph{\alph*}),ref=\theenumii\emph{\alph*}} % chktex 9
\setlist[description]{font=\bfseries}

% Floating objects style
% Ref: https://liam0205.me/2017/04/30/floats-in-LaTeX-the-positioning-algorithm/
\RequirePackage{float}
\setlength{\intextsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\setlength{\floatsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\setlength{\textfloatsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\setlength{\dblfloatsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\setlength{\dbltextfloatsep}{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\dbltopfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}

% Footer style
\RequirePackage[perpage]{footmisc}

% Theorem style
\RequirePackage[amsmath,amsthm,hyperref,thref]{ntheorem}
\theoremnumbering{arabic}
\theoremseparator{:}
\theorempreskip{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\theorempostskip{0.75\baselineskip plus 0.15\baselineskip minus 0.45\baselineskip} % chktex 1
\theoremheaderfont{\normalfont\bfseries}
\theoremsymbol{}
\def\proofname{\textbf{Proof}}
\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]
\newtheorem{proposition}{Proposition}[section]
\newtheorem{lemma}{Lemma}[section]
\newtheorem{theorem}{Theorem}[section]
\newtheorem{axiom}{Axiom}[section]
\newtheorem{corollary}{Corollary}[section]
\newtheorem{exercise}{Exercise}[section]
\newtheorem{example}{Example}

% custom title
\def\maketitle{
    \begin{center}
        {\bfseries\sffamily\Large \@title} \\[0.8em]
        {\sffamily \@author\hskip 2em\@date}
    \end{center}
}
