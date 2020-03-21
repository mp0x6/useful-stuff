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
