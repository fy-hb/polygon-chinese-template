\documentclass [11pt, a4paper, oneside] {article}
\usepackage [UTF8]{ctex}
\usepackage [T2A] {fontenc}
\usepackage [utf8] {inputenc}
\usepackage [english, russian] {babel}
\usepackage {amsmath}
\usepackage {amssymb}
\usepackage [chinese]{olymp}
\usepackage {comment}
\usepackage {epigraph}
\usepackage {expdlist}
\usepackage {graphicx}
\usepackage {multirow}
\usepackage {siunitx}
\usepackage {ulem}
\usepackage {hyperref}
\usepackage {import}
\usepackage {ifpdf}
\usepackage {xparse}
\usepackage {color}
\usepackage {lastpage}
\usepackage {listings}
\usepackage {booktabs}
\usepackage {etoolbox}

% 如果需要去掉题面中的 输入文件/输出文件/时间限制/空间限制 请分别取消注释这四项
% \def\NoInputFileName{}
% \def\NoOutputFileName{}
% \def\NoTimeLimit{}
% \def\NoMemoryLimit{}

% 如果需要左页留空 请取消注释下一行
% \intentionallyblankpagestrue

\ifpdf
  \DeclareGraphicsRule{*}{mps}{*}{}
\fi

\definecolor{mygreen}{RGB}{28,172,0}
\definecolor{mylilas}{RGB}{170,55,241}
\definecolor{mygray}{RGB}{128,128,128}
\definecolor{mymauve}{RGB}{124,6,123}
\definecolor{myblue}{RGB}{14,84,175}
\definecolor{mybg}{RGB}{248,248,248}

\lstset{
	basicstyle=\ttfamily,
	columns=fixed,
	numbers=left,
	numberstyle=\small\color{mygray},
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	frame=single,
	rulecolor=\color{black},
	tabsize=2,
	captionpos=t,
	breaklines=true,
	postbreak=\raisebox{0ex}[0ex][0ex]{\ensuremath{\hookrightarrow}\space},
	commentstyle=\color{mygreen},
	keywordstyle={\bfseries\color{blue}},
	stringstyle=\color{mymauve},
	deletekeywords={...},
	xleftmargin=2em,
	identifierstyle=\color{black},
}

\def\problemtoc{}

\newcommand{\addproblemtoc}[2]{\gappto\problemtoc{#1 & #2 \\}}

\makeatletter
\newcommand{\addtitletoproblemtoc}[2]{
\protected@write\@auxout{}{\string\addproblemtoc{#1}{#2}}
}
\makeatother

\newcommand{\makeproblemtoc}{
\begin{center}
\begin{tabular}{rl}
\toprule
题号 & 题目名称 \\
\midrule
\problemtoc
\bottomrule
\end{tabular}
\end{center}
}

\begin {document}

% 以下是题目标题页的示例

% \title{\textbf{\Huge{${contest.name!}}}}
% \date{${contest.date!}}
% \author{${contest.location!}}
% \maketitle
%
% \begin{center}
% \includegraphics[width=3in]{statements-logo.png}
% \end{center}
%
% \vspace{2.5em}
%
% \begin{center}
% \Large
%
% \makeproblemtoc
%
% \vspace{1em}
%
% \Large \textbf{请勿在比赛正式开始前打开题面！}
% \end{center}
% \thispagestyle{empty}
%
% \clearpage
% \phantom{s}
% \thispagestyle{empty}
% \setcounter{page}{0}
%
% \clearpage

\contest
{${contest.name!}}%
{${contest.location!}}%
{${contest.date!}}%


\binoppenalty=10000
\relpenalty=10000

%\renewcommand{\thefootnote}{\fnsymbol{footnote}}

<#if shortProblemTitle?? && shortProblemTitle>
  \def\ShortProblemTitle{}
</#if>

<#list statements as statement>
<#if statement.path??>
\graphicspath{{${statement.path}}}
<#if statement.index??>
  \def\ProblemIndex{${statement.index}}
</#if>
\import{${statement.path}}{./${statement.file}}
<#else>
\input ${statement.file}
</#if>
</#list>

\end {document}
