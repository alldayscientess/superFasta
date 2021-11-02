#!/bin/bash

# Welcome! My name is Tess, and I am a PhD student who finds myself needing to quickly make fasta files for my sequences.
# I got tired of doing this independently every time I wanted to make a fasta file, so I wrote this cute little script.

# Before you begin make sure to run [ chmod +x realFasta2.sh ] on the command line to make this code executable in your command line
# This script will run through  a list of files either of fastq file (.fastq or .gz) or one-column (.txt) file fomat and create fasta
# files for each file to be used for bioinformatic tools like Blast, MEME, etc.
# If your file has some other suffix, you can always change the file name by typing [ mv file.blah to file.fastq ] for example.
# This script runs on a list of files (very user friendly).
# To make a list of the files you want, follow directions in README

# I probably didn't think of every error, so it's possible the script won't work for reasons outside what are stated in the directions
# You can email me if you have any questions on how to use the tool! tess.cherlin@students.jefferson.edu

echo ---------------------------------------------------------------------
echo          
echo Hello, this realFasta2 script will turn your fastq or one-column sequence files into fasta files!
echo You can type "[" control+C "]" to quit this script at any time.
echo Make sure to use files with the following suffix options:
echo .txt .fastq .gz
echo     
echo ----------------------------------------------------------------------------------------
# This is the file variable 

read -p  "Please enter the file list of files  here (include path "if" not in this directory): " FILES

for f in `cat $FILES`

do
    echo $f

# This is a sanity check to make sure the file entered is in the correct format
if [[ $f = *".txt"* ]] || [[ $f = *".fastq"* ]] || [[ $f = *".gz"* ]]; then


    # This part of the code is to turn a fastq file into a fasta file 
    if [[ $f = *".fastq"* ]] || [[ $f = *".gz"* ]]; then
        echo We ran realFasta for your fastq file

        prefix=$(ls $f | sed 's/\.fastq//' | sed 's/\.gz//')
        echo $prefix.txt

        less $f | awk 'BEGIN{n=0}{if (n%4==1) print; n=n+1;}' > $prefix.fa

        echo Your fasta file is complete it is called: $prefix.fa

        # This part of the code is to turn a one column sequence file into a fasta file
    elif [[ $f = *".txt"* ]] ; then 

        echo We are going to run realFasta for your file which contains a list of sequences
        prefix2=$(ls $f | sed 's/\.txt//')
        echo $prefix2.txt
        lineNUMS=$(cat $f | wc -l )
        echo There are $lineNUMS lines in this file

        x=$(echo $lineNUMS); for ((i=1; i<=x; i++)); do echo $i; done > lineNUMS.txt

        paste lineNUMS.txt $f | awk '{print ">"$1"\n"$2}' > $prefix2.fa
        echo Your fasta file is complete it is called: $prefix2.fa    

        # This part of the code is displayed if neither arguments above are satisfied
        # Not sure if we need this...check again later
    else
        echo -------------------------------------------------------
        echo ERROR ERROR Try again
        echo ------------------------------------------------------
    fi
    # This part of the code returns an error message because you didn't use the correct file name
else

    echo ------------------------------------------------------
    echo This file is not configured correctly please try again. 
    echo Check spelling and follow the directions. 
    echo Make sure you use a .txt, .fastq, of .gz file. 
    echo ------------------------------------------------------
fi

done
