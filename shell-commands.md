# Nützliche Shellcommands

## PDF

ps2pdf input.pdf output.pdf	# vereinfacht die Logik der PDF-Dateien, lossless Komprimierung, killt DRM, behebt *keine* Fehler
gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -sOutputFile=repaired.pdf kaputt.pdf	# rebuilded das PDF, repariert und komprimiert (/prepress lossless, /ebook gute Qualität)
pdfunite datei1.pdf datei2.pdf datei3.pdf output.pdf
