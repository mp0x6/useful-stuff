# Useful shell commands

# #######################
# ########  PDF  ########
# #######################

# converts pdf to ps and back, compresses lossless, does *not* rebuild the pdf (so errors remain), no DRM-deletion
ps2pdf input.pdf output.pdf
# rebuilds and repairs, compresses if using /ebook for good quality, /prepress for lossless quality, gets rid of any DRM
gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -sOutputFile=repaired.pdf kaputt.pdf
# unites pdf files (but it does not work on DRM'ed files, may fail when encountering invalid PDF files)
pdfunite datei1.pdf datei2.pdf datei3.pdf output.pdf
