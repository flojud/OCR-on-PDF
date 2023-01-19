#!/bin/zsh

if ! command -v brew &> /dev/null
then
    echo "brew could not be found. Please install brew https://brew.sh/index_de"
    exit
fi

if ! command -v ocrmypdf &> /dev/null
then
    echo "ocrmypdf could not be found. Use brew to install ocrmypdf 'brew install ocrmypdf'"
    exit
fi

. ./pdf_ocr.config
if [ "$?" -eq 0 ]; then
    echo "Configuration loaded"
  else
    echo "Failed because of missing ./pdf_ocr.config"
    exit 1
  fi
[[ -z "$input" ]] && { echo "Error: input variable not configured."; exit 1; }
[[ -z "$output" ]] && { echo "Error: output variable not configured."; exit 1; }


for infile in $input/*.pdf; do
  pdf=`basename $infile`
  tmpfile=$(mktemp)
  outfile=$output/$pdf
  echo "Processing $pdf file...";
  gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook -dNOPAUSE -dQUIET -dBATCH -sOutputFile="$tmpfile" "$infile"
  ocrmypdf -l deu --deskew --skip-text "$tmpfile" "$outfile"
  
  if [ "$?" -eq 0 ]; then
    echo "Successfully OCR detection, delete input file ..."
    rm $infile
  else
    echo "Detection failed, check logs and try again."
  fi

  rm $tmpfile
done
