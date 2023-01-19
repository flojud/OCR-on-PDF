# OCR on my PDF

I always diligently scan my letters, only thing, the PDF document contains it as an image that is not searchable.

Therefore I use this small script which makes my texts searchable with the help of [Ghostsript](https://www.ghostscript.com/) and [OCRmyPDF](https://github.com/ocrmypdf/OCRmyPDF).

The script runs on my Mac. With Homebrew you can install ocrmypdf and there you go. I've put a small configuration file next to the bash script:

```
input=~/CloudStorage/Scan/input
output=~/CloudStorage/Scan/output
```


> ./pdf_ocr.sh
Configuration loaded
Processing image-based-pdf-sample.pdf file...
Scanning contents: 100%|████████████████████████████████████████████████████████| 1/1 [00:00<00:00, 48.72page/s]
OCR: 100%|████████████████████████████████████████████████████████| 1.0/1.0 [00:03<00:00,  3.52s/page]
Postprocessing...
PDF/A conversion: 100%|████████████████████████████████████████████████████████| 1/1 [00:00<00:00,  6.48page/s]
Recompressing JPEGs: 0image [00:00, ?image/s]
Deflating JPEGs: 100%|████████████████████████████████████████████████████████| 1/1 [00:00<00:00, 95.23image/s]
JBIG2: 0item [00:00, ?item/s]
Optimize ratio: 1.33 savings: 24.7%
Output file is a PDF/A-2B (as expected)
Successfully OCR detection, delete input file ...
 ~/g/OCR-on-PDF  on main !2 ?1                                                               ok  took 8s  base py  at 20:07:01 


