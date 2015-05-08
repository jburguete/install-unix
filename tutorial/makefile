msys2_png = \
	MSYS2-1.png \
	MSYS2-2.png \
	MSYS2-3.png \
	MSYS2-4.png \
	MSYS2-5.png \
	MSYS2-6.png \
	MSYS2-7.png \
	MSYS2-8.png \
	MSYS2-9.png \
	MSYS2-10.png \
	MSYS2-11.png \
	MSYS2-12.png \
	MSYS2-13.png \
	MSYS2-14.png \
	MSYS2-15.png \
	MSYS2-16.png \
	MSYS2-17.png \
	MSYS2-18.png \
	MSYS2-19.png \
	MSYS2-20.png \
	MSYS2-21.png \
	MSYS2-22.png \
	MSYS2-23.png \
	MSYS2-24.png
latex_png = \
	Latex-1.png \
	Latex-2.png \
	Latex-3.png \
	Latex-4.png \
	Latex-5.png \
	Latex-6.png \
	Latex-7.png \
	Latex-8.png \
	Latex-9.png \
	Latex-10.png \
	Latex-11.png

msys2_eps = MSYS2-24.png.eps
latex_eps = Latex-11.png.eps

figures = $(msys2_eps) $(latex_eps)

../tutorial.pdf: tutorial.tex makefile $(figures)
	latex tutorial
	latex tutorial
	dvipdfmx -o ../tutorial.pdf tutorial.dvi

$(msys2_eps): $(msys2_png)
	./script MSYS2

$(latex_eps): $(latex_png)
	./script Latex
