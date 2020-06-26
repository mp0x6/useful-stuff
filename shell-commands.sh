# Useful shell commands

# #######################
# ########  PDF  ########
# #######################

# converts pdf to ps and back, compresses lossless, does *not* rebuild the pdf (so errors remain), no DRM-deletion
ps2pdf input.pdf output.pdf
# rebuilds and repairs, compresses if using /ebook for good quality, /prepress for lossless quality, gets rid of some DRM. If you need more, use Calibre with plugins.
gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress -sOutputFile=repaired.pdf defect.pdf
# unites pdf files (but it does not work on DRM'ed files, may fail when encountering invalid PDF files)
pdfunite datei1.pdf datei2.pdf datei3.pdf output.pdf


# #######################
# #### GENERAL STUFF ####
# #######################

# display a clock in the top right of the cli-window
while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &
# don't show strangers your camera equipment
exiftool -Model="" -Lens="" -lensid="" -lensprofilename="" -lensmodel="" -lensprofilefilename="" -serialnumber="" -lensinfo="" -lensmodel="" -lensid="" -lenstype="" -LensID="" -LensMake="" -creator="" -artist="" -make=""-history="" -by-line="" -historyparameters="" -firmware="" *.JPG
# mux audio and video without reencoding (also works with audio-only mp4!) (https://superuser.com/questions/277642/how-to-merge-audio-and-video-file-in-ffmpeg)
ffmpeg -i video.mp4 -i audio.wav -c:v copy -c:a aac -strict experimental output.mp4
# liberate fonts by setting the embeddable flag to the most liberal setting using ttembed (https://github.com/hisdeedsaredust/ttembed)
ttembed Fonts/*
# get only the file link from stdin
grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*"
# get everything but the match from stdin
grep -v 'foo'
# only get unique values
| uniq
# ocr image pdfs
ocrmypdf in.pdf out.pdf
# get all image links from a file, sort them not using string search, download them, make optimized pdf and delete everything that's not an pdf or mp4
cat *.txt | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | grep 'critera1' | grep -v 'criteria2' | uniq | wget -i - && convert $(ls *.jpg | sort -V) file.pdf && ocrmypdf file.pdf output.pdf && rm file.pdf "$(ls | grep -v 'mp4' | grep -v 'pdf')"
