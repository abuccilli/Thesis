% University of Alabama MS/PhD thesis/dissertation LaTeX Class File
%
% Copyright (c) 2012 Paul Kilgo
% The latest version of this file may be obtained from
%   https://github.com/OEP/uathesis
%
% License: LaTeX Project Public License (www.latex-project.org/lppl.txt)
%   Executive summary:
%       This software is copyright but you are granted a license which gives
%       you, the "user" of the software, legal permission to copy, distribute,
%       and/or modify the software. However, if you modify the software and
%       then distribute it (even just locally) you must change the name of the
%       software to avoid confusion.
%
% OR (dual-licensed)
%
% License: GNU Lesser General Public License (www.gnu.org/licenses/lgpl.html)
%
% Author Information:
%   Paul Kilgo
%   The University of Alabama
%   paulkilgo@gmail.com
%
% Any change requests are appreciated if proposed through Github. Any bug
% reporting should also be done through Github as well.
%
% Happy writing!
%
%
% Modified by Andrew Buccilli

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{uathesis}

\RequirePackage{ifthen}

\newif\ifthesis
\DeclareOption{thesis}{\thesistrue}
\DeclareOption{dissertation}{\thesisfalse}

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{report}%
}
\ProcessOptions\relax
\LoadClass[12pt]{report}

%\usepackage[top=1in,bottom=1in,left=1in,right=1in,showframe]{geometry}
\usepackage[top=1in,bottom=1in,left=1in,right=1in]{geometry}

\usepackage{titlesec}
\titleformat{\chapter}[display]   
{\normalfont\huge\bfseries}{\chaptertitlename\ \thechapter}{20pt}{\Huge}   
\titlespacing*{\chapter}{0pt}{28pt}{40pt}

\usepackage{setspace}
\usepackage{textcase}
\usepackage[subfigure]{tocloft}

\renewcommand{\cftdot}{.}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand\cftchappresnum{Chapter }
\newlength\mylen
\settowidth\mylen{\bfseries Chapter 1\ }
\addtolength{\mylen}{0pt}
\cftsetindents{chap}{0pt}{\mylen}
\setlength{\cftbeforechapskip}{0pt}

\setlength\cftbeforefigskip{12pt}
\setlength\cftbeforetabskip{12pt}

\renewcommand\cftbeforetoctitleskip{56pt}
\renewcommand\cftbeforeloftitleskip{59.5pt}
\renewcommand\cftbeforelottitleskip{59.5pt}

%% Thesis committee
\newcommand\committee[1]{\renewcommand\@committee{#1}}
\newcommand\@committee{Committee undefined}

%% Adviser
\newcommand\adviser[1]{\renewcommand\@adviser{#1}}
\newcommand\@adviser{Adviser undefined}

%% Candidate degree
\newcommand\degree[1]{\renewcommand\@degree{#1}}
\newcommand\@degree{Undefined Degree}

%% University (if not UA)
\newcommand\university[1]{\renewcommand\@university{#1}}
\newcommand\@university{The University of Alabama}

%% Department
\newcommand\department[1]{\renewcommand\@department{#1}}
\newcommand\@department{Undefined Department}

%% School (in case of undergrad thesis or something)
%\newcommand\school[1]{\renewcommand\@school{#1}}
%\newcommand\@school{Graduate School}

%% Year of graduation
\newcommand\gradyear[1]{\renewcommand\@gradyear{#1}}
\newcommand\@gradyear{\the\year}

%% Place
\newcommand\place[1]{\renewcommand\@place{#1}}
\newcommand\@place{Tuscaloosa, Alabama}

%% Abstract body text
\renewcommand\abstract[1]{\renewcommand\@abstract{#1}}
\newcommand\@abstract{No abstract body text.}

%% Dedication body text
\newcommand\dedication[1]{\renewcommand\@dedication{#1}}
\newcommand\@dedication{No dedication body text.}

%% Acknowledgments body text
\newcommand\acknowledgments[1]{\renewcommand\@acknowledgments{#1}}
\newcommand\@acknowledgments{No acknowledgments body text.}

%% Rename bibliography
\renewcommand{\bibname}{References}

\newcommand*{\noaddvspace}{\renewcommand*{\addvspace}[1]{}}
\addtocontents{lof}{\protect\noaddvspace}
\addtocontents{lot}{\protect\noaddvspace}

\newcommand{\makefrontmatter}
{
  \thispagestyle{empty}
  {\centering
    \singlespacing
    \renewcommand{\and}{\NoCaseChange{\\}}

    \vspace*{-18pt}
    \vspace*{1in}
    \MakeTextUppercase{\@title}

    \hfill \linebreak
    \hfill \linebreak
    \hfill \linebreak
    by
    \hfill \linebreak

    \MakeTextUppercase{\@author} \hfill \linebreak

    \MakeTextUppercase{\@adviser, Committee Chair \hfill \and \@committee}  
    \hfill \linebreak
    \hfill \linebreak
    \hfill \linebreak
    \ifthesis
      A THESIS
    \else
      A DISSERTATION
    \fi
    \hfill \linebreak
    \hfill \linebreak
    \hfill \linebreak
    \hfill \linebreak
	    Submitted in partial fulfillment of the requirements \hfill \\
      for the degree of \@degree \hfill \\
      in the Department of \@department \hfill \\
      in the Graduate School of \hfill \\
      \@university
	\hfill \linebreak
  \hfill \linebreak
  \hfill \linebreak

	\hfill \linebreak

	\MakeTextUppercase{\@place} \hfill \linebreak
    \hfill \linebreak
   \hfill \linebreak
   \hfill \linebreak
	\@gradyear \hfill \linebreak
  \par
  \vspace*{-12pt}
  }

\pagebreak

    
\begin{frontmatter}
  \chapter*{\textbf{Abstract}}
  \addcontentsline{toc}{chapter}{Abstract}
  \@abstract

  \chapter*{\textbf{Dedication}}
  \addcontentsline{toc}{chapter}{Dedication} 
  \@dedication

  \chapter*{\textbf{Acknowledgments}}
  \addcontentsline{toc}{chapter}{Acknowledgments}
  \@acknowledgments

  \pagebreak
  \tableofcontents

  \pagebreak

  \begin{singlespace}
    \listoftables 
  \end{singlespace}
 
  \pagebreak
  \begin{singlespace}
    \listoffigures
  \end{singlespace}
\end{frontmatter}

}
  
\newcommand{\makecopyright}
{
  \thispagestyle{empty}
  \begin{singlespace}
  \vspace*{\fill}
  {\centering
    Copyright Andrew Thomas Buccilli 2019 \hfill\\
    ALL RIGHTS RESERVED \par
  }
  \end{singlespace}
}

\newenvironment{frontmatter}
{
  \makecopyright
  \pagebreak
  \pagenumbering{roman}
  \setcounter{page}{2}
  \setcounter{chapter}{0}
  \begin{doublespace}
}
{
  \end{doublespace}
}

\newenvironment{body}
{
  \pagebreak
  \pagenumbering{arabic}
  \setcounter{page}{1}
  \setcounter{chapter}{0}
  \begin{doublespace}
}
{
  \end{doublespace}
}

%\makeglossaries