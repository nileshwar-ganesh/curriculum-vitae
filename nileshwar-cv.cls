% Mandatory declaration
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nileshwar-cv}[2023/03/11 Single Page CV]

% Loading article class
\LoadClass{article}


%---- START : REQUIRED PACKAGES----%
% No user input required, unless user wants to have additional packages
% Setting up font for the document
\RequirePackage[sfdefault]{ClearSans} % Default font -> Clear Sans
\RequirePackage{lmodern} % Font encoding -> Vector

% Package to create graphic elements
\RequirePackage{tikz}

% Package to create conditional entries
\RequirePackage{ifthen}

\RequirePackage{fontawesome5} % required for icons

\RequirePackage{textpos} % required for text block

\RequirePackage{hyperref} % required to create links

\RequirePackage{lipsum}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% setting margins of the page
\RequirePackage[bottom=0.5cm, top=0cm, left=0.35cm, right=0.5cm]{geometry}
%---- END : REQUIRED PACKAGES----%

%---- START : MISC PAGE SETTINGS----%
% No user input required
\pagestyle{empty} % to remove page number
\setlength{\parindent}{0pt} % to remove paragraph indentation
%---- END : MISC PAGE SETTINGS----%

%----USER - SELECT COLOUR SCHEME----%
% user can select the color scheme
% Options : gray, vanilla, ...
% Default scheme - gray
\newcommand{\colorscheme}{vanilla}
%----USER - END OF COLOUR SCHEME----%

%----START : COLOUR SCHEME----%
% No user input required, unless the user wants to create a new colour scheme
% Basic Colours
\definecolor{white}{HTML}{FFFFFF}
\definecolor{black}{HTML}{000000}

% Colour scheme - gray
\definecolor{strip-gray}{HTML}{E7E7E7}
\definecolor{bar-gray}{HTML}{B9B9B9}
\definecolor{bar-blue}{HTML}{0E5484} %00169A
\definecolor{text-gray}{HTML}{4D4D4D}

% Colour scheme - vanilla
\definecolor{strip-vanilla}{HTML}{F3E5AB}
\definecolor{bar-vanilla}{HTML}{E7C951}
\definecolor{bar-brown}{HTML}{726C52}
\definecolor{text-vanilla}{HTML}{635E47} %817A5D
%----END : COLOUR SCHEME----%


%----START : SETTING USER SELECTED COLOUR SCHEME----%
% No user input required
\newcommand{\stripcolor}{}
\newcommand{\barcolorA}{}
\newcommand{\barcolorB}{}
\newcommand{\highlighttextcolor}{}


\ifthenelse{\equal{\colorscheme}{gray}}{
	\renewcommand{\stripcolor}{strip-gray}
	\renewcommand{\barcolorA}{bar-gray}
	\renewcommand{\barcolorB}{bar-blue}
	\renewcommand{\highlighttextcolor}{text-gray}	
}{
\ifthenelse{\equal{\colorscheme}{vanilla}}{
	\renewcommand{\stripcolor}{strip-vanilla}
	\renewcommand{\barcolorA}{bar-vanilla}
	\renewcommand{\barcolorB}{bar-brown}
	\renewcommand{\highlighttextcolor}{text-vanilla}	
}{
	\renewcommand{\stripcolor}{strip-gray}
	\renewcommand{\barcolorA}{bar-gray}
	\renewcommand{\barcolorB}{bar-blue}
	\renewcommand{\highlighttextcolor}{text-gray}
}}
%----END : SETTING USER SELECTED COLOUR SCHEME----%

%---- START : DEFINING NEW COMMANDS FOR SIDE BAR----%
% User input - optional
\newlength\sidebarwidth
\setlength{\sidebarwidth}{0.33\paperwidth}
\newlength\mainbodywidth
\setlength{\mainbodywidth}{0.66\paperwidth}
\newlength\imagewidth
\setlength{\imagewidth}{0.3\paperwidth}

% No user input required
\newcommand{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand{\cvdob}[1]{\renewcommand{\cvdob}{#1}}
\newcommand{\cvbirthplace}[1]{\renewcommand{\cvbirthplace}{#1}}
\newcommand{\cvbirthcountry}[1]{\renewcommand{\cvbirthcountry}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\cvaddress}{#1}}
\newcommand{\cvtelephone}[1]{\renewcommand{\cvtelephone}{#1}}
\newcommand{\cvemail}[1]{\renewcommand{\cvemail}{#1}}
\newcommand{\cvgiturl}[1]{\renewcommand{\cvgiturl}{#1}}
\newcommand{\cvlinkedin}[1]{\renewcommand{\cvlinkedin}{#1}}
\newcommand{\cvpic}[1]{\renewcommand{\cvpic}{#1}}

\newcommand{\cvbirth}[1]{\renewcommand{\cvbirth}{#1}}
\cvbirth{\cvdob~in~\cvbirthplace,~\cvbirthcountry}

% circle with bg color based on selected scheme
\newcommand*{\highlightcircle}[1]{
	\begin{tikzpicture}
		\node[anchor=base, shape=circle, draw=\barcolorB, inner sep=0pt, outer sep=0pt, minimum size=0.72cm, fill=\barcolorB]{\color{white}{#1}};
	\end{tikzpicture}
}

% attaches icon to personal info and provides a text to display
\newcommand{\cvpersonalinfo}[2]{
		\begin{minipage}{0.72cm}
			\vspace{-0.4cm}
			\highlightcircle{#1}
		\end{minipage}
		\begin{minipage}{6cm}
			\normalcolor
			\vspace{-0.4cm}			
			\-\ ~#2\\
		\end{minipage}	
}

% creates clickable href links for emails and websites
\newcommand{\cvpersonallinks}[3]{
	\begin{minipage}{0.72cm}
		\vspace{-0.4cm}
		\highlightcircle{#1}
	\end{minipage}
	\begin{minipage}{6cm}
		\normalcolor
		\vspace{-0.4cm}
		\foreach \n in #3{
			\-\ ~\href{#2\n}{\n}\\
		}	
	\end{minipage}	
}

% create side profile section - header \rule
\newlength{\textlength}
\newlength{\linelength}
\newcommand{\sidesection}[1]{
	\setlength\linelength{0.30\paperwidth}
	\settowidth{\textlength}{\LARGE #1}
	\addtolength{\linelength}{-\textlength}
	{\color{black!75} {\LARGE #1}
	\rule[0.4\baselineskip]{\linelength}{1.5pt}}\\
}

\newcommand\languages[1]{ 
	\renewcommand{\languages}{
		\begin{tikzpicture}
		\foreach [count=\i] \x/\l/\y in {#1}{
			\node[anchor=west] at (0, -\i * 0.5cm) {\normalcolor\normalsize\x ~(\textit{\small{\l}})};			
			\foreach \n in {1,2,...,6}{
				\filldraw[\barcolorA] (4.2cm + \n * 0.3cm,  -\i * 0.5cm) circle (3pt);
			}
			\begin{scope}
				\clip (4.2cm - 4.5pt, -\i * 0.5cm - 4.5pt) rectangle (4.2cm + \y * 0.3cm + 4.5pt, -\i * 0.5cm + 4.5pt);
			\foreach \n in {1,2,...,6}{
				\filldraw[\barcolorB] (4.2cm + \n * 0.3cm,  -\i * 0.5cm) circle (3pt);
			}
			\end{scope}
		}
		\end{tikzpicture}
		\vspace{0.2cm}
	}
}

\newcommand\programmingskills[1]{ 
	\renewcommand{\programmingskills}{
		\begin{tikzpicture}
			\foreach [count=\i] \x/\y in {#1}{
				\node[anchor=east] at (0, -\i * 0.5cm) {\normalsize\normalcolor \x};
				\draw[fill=\barcolorA, \barcolorA] (0.75,-\i * 0.5cm + 0.06cm) rectangle (4.5,-\i * 0.5cm - 0.05cm  );
				\draw[fill=\barcolorB, \barcolorB](0.75,-\i * 0.5cm + 0.06cm) rectangle (\y * 4.5 / 6 ,-\i * 0.5cm - 0.05cm);
			}
			\foreach[count=\i] \n in {0,...,6}{ 
				\node[anchor=east] at ((0.36 + \i * 0.625,-2.9 cm) {\scriptsize \n};
			}
		\end{tikzpicture}
		\vspace{0.2cm}
	}
}

\newcommand{\skilltag}[1]{%
	\renewcommand{\skilltag}{
		\vspace{-0.2cm}
		
		\begin{minipage}{0.307\paperwidth}
			\foreach [count=\i] \x in {#1}{
				\ifthenelse{\equal{\x}{}}{}{
					\begin{tikzpicture}
						\node[draw=\highlighttextcolor,rounded corners,inner xsep=1ex,inner ysep=1ex, text depth=.5ex]{\normalcolor\x};
					\end{tikzpicture}
				}
			}
		\end{minipage}
		\vspace{0.2cm}
		
	}
}

\newcommand{\references}[1]{
	\renewcommand{\references}{
		\ifthenelse{\equal{#1}{}}{}{
			\foreach \d in {#1}{
				\vspace{-0.1cm}
				
				\begin{minipage}{0.33\paperwidth}
					\normalcolor\normalsize
					\foreach [count=\i] \v in \d{
						\ifthenelse{\equal{\i}{1}}{\noindent\textbf{\v}\\}{}
						\ifthenelse{\equal{\i}{2}}{\noindent\v\\}{}
						\ifthenelse{\equal{\i}{3}}{\href{mailto:\v}{\v}\\}{}
						\ifthenelse{\equal{\i}{4}}{Tel:~\v\\}{}
					}
				\end{minipage}
					
			}
		}
	}
}

% create side bar profile
\newcommand{\createsideprofile}{
	% this creates a side profile bar based on color scheme
	\begin{tikzpicture}[remember picture,overlay]
		\path	(current page.north west) 
				node[below right, 
			 		 fill=\stripcolor, 
			 		 minimum width=\sidebarwidth, 
			 		 minimum height=\paperheight] 
				(box){};
	\end{tikzpicture}
	
	% the box/block which holds personal info and links
	\begin{textblock}{6}(0, 0)
		% insert cv picture
		\ifthenelse{\equal{\cvpic}{}}{}{
			\begin{tikzpicture}
				\node [inner sep=0pt] (image) {\colorbox{white}{\includegraphics[trim={0cm 0cm 0cm 0cm}, clip, width=\imagewidth]{cvpic}}};
				% [trim={left bottom right top},clip]
				\draw[draw=\stripcolor, fill=\stripcolor, even odd rule] (image.north west) rectangle (image.south east){
				(-0.15,0) circle (2.7cm)};
			\end{tikzpicture}
		}
	
		% insert cv name
		\ifthenelse{\equal{\cvname}{}}{}
		{\color{\barcolorB}{\huge \cvname} \newline \vspace{0.5cm}}
		
		% personal info
		\ifthenelse{\equal{\cvbirth}{}}{}
		{\cvpersonalinfo{\faIcon{birthday-cake}}{\cvbirth}}
		
		\ifthenelse{\equal{\cvaddress}{}}{}
		{\cvpersonalinfo{\faIcon{address-card}}{\cvaddress}}
		
		\ifthenelse{\equal{\cvtelephone}{}}{}
		{\cvpersonalinfo{\faIcon{phone}}{\cvtelephone}}
		
		\ifthenelse{\equal{\cvemail}{}}{}
		{\cvpersonallinks{\faIcon{at}}{mailto:}{\cvemail}}
		
		\ifthenelse{\equal{\cvgiturl}{}}{}
		{\cvpersonallinks{\faIcon{github}}{https://}{\cvgiturl}}
		
		\sidesection{Languages}
		\languages
		
		\sidesection{Programming Skills}
		\programmingskills
		
		\sidesection{Other Skills}
		\skilltag
		
		\sidesection{References}
		\references
		
	\end{textblock}	
}

%---- END : DEFINING NEW COMMANDS FOR SIDE BAR----%


%---- START : DEFINING NEW COMMANDS FOR MAIN BODY----%
% No user input required
% create section header
% -> first : create a rounded rectangular box
\newcommand*{\headerbox}[2]{
	\Large
	\begin{tikzpicture}
		\node[anchor=base, draw=#1, rounded corners, inner xsep=0.75ex, inner ysep=0.45ex, fill=#1]{\color{white}{#2}};
	\end{tikzpicture}
}
% -> second : create alternating color to fill in the header box
\newcounter{counter}
\newcommand{\headercolor}[1]{
	\ifcase\value{counter}
		\headerbox{\barcolorA}{#1}
	\or
		\headerbox{\barcolorB}{#1}
	\or
		\headerbox{\barcolorA}{#1}
	\or
		\headerbox{\barcolorB}{#1}
	\or
		\headerbox{\barcolorA}{#1}
	\or
		\headerbox{\barcolorB}{#1}
	\or
		\headerbox{\barcolorA}{#1}
	\else
		\headerbox{\barcolorB}{#1}
	\fi
	\stepcounter{counter}
}
% -> third : create a command to pass header text
\newcommand{\header}[1]{
	\vspace{0.1cm} 
	\headercolor{#1} \newline}
% end of section header	

% start of content text
% creates a bullet point with 0.1cm indent
\newcommand{\bulletpoint}{\-\ \hspace{0.1cm} $\bullet$}
% creates a bullet point text - justified on both ends
\newcommand{\bullettext}[1]{
	\normalsize{\color{black}{
	% option [t] ensures that top is justified inside minipage
	\begin{minipage}[t]{0.05\linewidth}
		\bulletpoint
	\end{minipage}
	\begin{minipage}[t]{0.95\linewidth}
		#1
	\end{minipage}
	}}
}
% header main text with highlight
\newcommand{\headertexthighlight}[2]{
	\normalsize{{\color{\highlighttextcolor} #1} \hfill #2} \\
}
% header main text without highlight
\newcommand{\headertextnormal}[2]{
	\normalsize{{\color{black} #1} \hfill #2} \\
}
% header supplementary text
\newcommand{\headertextarea}[2]{
	\textit{#1~}:~\small{{\color{black} #2}} \\
}

% thesis
\newcommand{\thesis}[1]{
	\foreach [count=\i] \x in #1{
		\ifthenelse{\equal{\i}{1}}{
			\vspace{-0.2cm}
			
			\begin{minipage}{0.63\paperwidth}
				\foreach \a/\b/\c/\d in \x{
					\-\ ~\textit{\a~}:~{\color{\highlighttextcolor}\b}~at~\c \hfill \mbox{\d}
				}
			\end{minipage}
			
		}{}
		\ifthenelse{\equal{\i}{2}}{
			\vspace{0.2cm}
					
			\begin{minipage}{0.63\paperwidth}
				\normalsize \normalcolor
				\foreach \o in \x{
					\begin{minipage}[t]{0.5cm}
						\-\ ~~$\bullet$~
					\end{minipage}
					\begin{minipage}[t]{0.61\paperwidth}
						\o
					\end{minipage}
				}
			\end{minipage}	
		}{}
	}
}

% project
\newcommand{\project}[1]{
	\foreach [count=\i] \x in #1{
		\ifthenelse{\equal{\i}{1}}{
			\vspace{-0.2cm}
			
			\begin{minipage}{0.63\paperwidth}
				\foreach \a/\b/\c in \x{
					\-\ ~\textit{\a~}:~{\color{\highlighttextcolor}\b}~-~\c
				}
			\end{minipage}
			\vspace{0.1cm}
			
		}{}
	}
}

% Defining a template for responsibilities
\newcommand{\responsibilities}[1]{
	\vspace{-0.4cm}
	
	\begin{minipage}[t]{0.18\linewidth}
		\normalsize{\textit{Responsibilities~}}
	\end{minipage}
	\begin{minipage}[t]{0.81\linewidth}
		\normalsize
		\foreach \x in #1{
			\begin{minipage}[t]{0.05\linewidth}
				\bulletpoint
			\end{minipage}
			\begin{minipage}[t]{0.95\linewidth}
				\x
			\end{minipage}
		}
	\end{minipage}
}
% Defining a template for highlights
\newcommand{\highlights}[1]{
	\vspace{-0.4cm}
	
	\begin{minipage}[t]{0.18\linewidth}
		\normalsize{\textit{Highlights~}}
	\end{minipage}
	\begin{minipage}[t]{0.81\linewidth}
		\normalsize
		\foreach \x in #1{
			\begin{minipage}[t]{0.05\linewidth}
				\bulletpoint
			\end{minipage}
			\begin{minipage}[t]{0.95\linewidth}
				\x
			\end{minipage}
		}
		\newline
	\end{minipage}
}

\newcommand{\profiledetails}[1]{
	\renewcommand{\profiledetails}{
		\vspace{-0.5cm}
		
		\begin{minipage}{0.63\paperwidth}
			\normalsize \normalcolor
			\foreach \x in {#1}{
				\begin{minipage}[t]{0.4cm}
					\-\ ~$\bullet$~
				\end{minipage}
				\begin{minipage}[t]{0.61\paperwidth}
					\x
				\end{minipage}
			}
		\end{minipage}	
	}
}



\newcommand{\workexperience}[1]{
	\renewcommand{\workexperience}{
		\vspace{-0.5cm}
		
		\begin{minipage}{0.63\paperwidth}
			\normalsize \normalcolor
			\foreach \dataset in {#1}{
				\foreach [count=\i] \data in \dataset{
					\ifthenelse{\equal{\i}{1}}{
						\foreach \x/\y in \data{
							\headertexthighlight{\x}{\y}
						}
					}{}
					\ifthenelse{\equal{\i}{2}}{
						\foreach \x\y in \data{
							\ifthenelse{\equal{\x}{\y}}{
								\headertextnormal{\x}{}
							}{
								\headertextnormal{\x}{\y}
							}
						}
					}{}
					\ifthenelse{\equal{\i}{3}}{
						\ifthenelse{\equal{\data}{}}{}{
							\headertextarea{Research area}{\data}}
					}{}
					\ifthenelse{\equal{\i}{4}}{
						\ifthenelse{\equal{\data}{}}{}{\responsibilities{\data}}
					}{}
					\ifthenelse{\equal{\i}{5}}{
						\ifthenelse{\equal{\data}{}}{}{\highlights{\data}}
					}{}
				}	
			}
		\end{minipage}	
	
	}
}

\newcommand{\academics}[1]{
	\renewcommand{\academics}{
		\vspace{-0.5cm}
		
		\begin{minipage}{0.63\paperwidth}
			\normalsize \normalcolor
			\foreach \dataset in {#1}{
				\foreach [count=\i] \data in \dataset{
					\ifthenelse{\equal{\i}{1}}{
						\foreach \x/\y in \data{
							\headertexthighlight{\x}{\y}
						}
					}{}
					\ifthenelse{\equal{\i}{2}}{
						\foreach \x\y in \data{
							\ifthenelse{\equal{\x}{\y}}{
								\headertextnormal{\x}{}
							}{
								\headertextnormal{\x}{\y}
							}
						}
					}{}
					\ifthenelse{\equal{\i}{3}}{
						\thesis{\data}
					}{}
					\ifthenelse{\equal{\i}{4}}{
						\project{\data}
					}{}
				}	
			}
		\end{minipage}	
		
	}
}


\newcommand{\publications}[1]{
	\renewcommand{\publications}{
		\vspace{-0.4cm}
		
		\begin{minipage}{0.63\paperwidth}
			\normalsize \normalcolor
			\foreach \x in {#1}{
				\x
			}
		\end{minipage}
		\vspace{0.1cm}
		
	}
}

\newcommand{\extracurriculars}[1]{
	\renewcommand{\extracurriculars}{
		\vspace{-0.5cm}
		
		\begin{minipage}{0.63\paperwidth}
			\normalsize \normalcolor
			\foreach \x in {#1}{
				\begin{minipage}[t]{0.4cm}
					\-\ ~$\bullet$~
				\end{minipage}
				\begin{minipage}[t]{0.61\paperwidth}
					\x
				\end{minipage}
			}
		\end{minipage}
	}
}

% create main body
\newcommand{\createmainprofile}{
	% this creates a side profile bar based on color scheme
		
	% the box/block which holds personal info and links
	\begin{textblock}{12}(5.2, 0)
		\header{Profile}
		\profiledetails
		
		\header{Work Experience}
		\workexperience
		
		\header{Academics}
		\academics
		
		\header{Publication}
		\publications
		
		\header{Extra Curricular Activities}
		\extracurriculars
		
		
	\end{textblock}	
}
%---- END : DEFINING NEW COMMANDS FOR MAIN BODY----%