%
% An unofficial LaTeX class for Politecnico Grancolombiano articles.
% overleaf.com/learn/latex/How_to_Write_a_Thesis_in_LaTeX_(Part_1):_Basic_Structure
%
% https://www.overleaf.com/project/5ee05092476b1700019833fd
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{poli}[2020/06/09 v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*
\LoadClass{article}

%
% Language
%
\RequirePackage[spanish,es-tabla]{babel} % Cargamos es-tabla para Tabla en lugar de Cuadro
\RequirePackage[utf8]{inputenc} % Codificación de entrada
\RequirePackage[T1]{fontenc} % Codificación de fuente
\RequirePackage{times} % Loads the Times-Roman Fonts
\renewcommand{\familydefault}{\sfdefault}

%
% Paper format and margins
%
\RequirePackage[%
  left=3cm,%
  right=3cm,%
  top=3cm,%
  bottom=3cm,%
  headheight=12pt,%
  letterpaper]{geometry}%

%
% Color
%
\RequirePackage{xcolor}
\definecolor{poliBlue}{RGB}{46, 116, 181}
\AtBeginDocument{\color{poliBlue}}

%
% Headers and footers
%
\RequirePackage{eso-pic}
\RequirePackage{tikz} 
\usetikzlibrary{calc}

\AddToShipoutPictureBG{
	\begin{tikzpicture}[remember picture,overlay]
	\fill [anchor=north west,inner sep=0pt,poliBlue]
	(current page.north west)  rectangle ($(current page.north east) + (0,-1.5cm)$);
	\end{tikzpicture}

	 \AtPageUpperLeft{%
	 	\makebox[270pt][r]{% Move over to right so right aligns with right of text block
	 		%\makebox[\textwidth][r]{% Move over to right so right aligns with right of text block
	 		\raisebox{-1cm}{% Drop down so top aligns with top of text block
	 			\bfseries\color{white}\Huge Working papers
	 		}%
	 	}%
	 }%
	 
	 \AtPageUpperLeft{%
	 	\makebox[560pt][r]{% Move over to right so right aligns with right of text block
	 	%\makebox[\textwidth][r]{% Move over to right so right aligns with right of text block
	 		\raisebox{-1.2cm}{% Drop down so top aligns with top of text block
	 			\color{white}\footnotesize MAESTRÍA EN INGENIERÍA DE SISTEMAS
	 		}%
	 	}%
	 }%
}


%
% Custom title page 
%
\renewcommand{\@maketitle}{%
	{%
		\vskip18pt%
		{\raggedright\bfseries\fontsize{16}{18}\selectfont \@title\par}%
		\vskip18pt
		{\raggedright\bfseries\large \@author\par}%
		\vskip24pt
		{\raggedright\sffamily\fontsize{12}{16}\selectfont  \@date\par}
		\vskip9pt
		\raggedright\line(1,0){80}
		\vskip9pt
	}%
}%

%
% Metadata
%
%\newcommand{\keywords}[1]{\def\@keywords{#1}}
% Keywords command
\providecommand{\keywords}[2]{
	\vskip9pt
	\noindent\color{black}\textbf{\textit{#1: }} \color{poliBlue}#2
	\vskip18pt
}

\renewenvironment{abstract}{%
	\begin{flushleft}%
		{\bfseries \color{black}\abstractname\vspace{0pt}}%
	\end{flushleft}%
}%

%
% section/subsection/paragraph set-up
%
\RequirePackage[explicit]{titlesec}
\titleformat{\section}
{\color{black}\normalsize\sffamily\bfseries\uppercase}
{\thesection}
{0.5em}
{#1}
[]

\titleformat{name=\section,numberless}
{\color{black}\normalsize\sffamily\bfseries}
{}
{0em}
{#1}
[]
  
\titleformat{\subsection}
{\color{black}\sffamily\bfseries}
{\thesubsection}
{0.5em}
{#1}
[]

\titleformat{\subsubsection}
{\color{black}\sffamily\small\bfseries\itshape}
{\thesubsubsection}
{0.5em}
{#1}
[]

%\titleformat{\paragraph}[runin]
%{\sffamily\small\bfseries}
%{}
%{0em}
%{#1} 

%\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
%\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
%\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
%\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}