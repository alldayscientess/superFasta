#!/bin/bash

# Welcome! My name is Tess, and I am a PhD student who finds myself needing to quickly make fasta files for my sequences.
# I got tired of doing this independently every time I wanted to make a fasta file, so I wrote this cute little script.

# Before you begin make sure to run [ chmod +x realFasta.sh ] on the command line to make this code executable in your command line
# This script will read in a fastq file (.fastq or .gz) or a one column (.txt) file and create a fasta file to be used for bioinformatic tools like Blast, MEME, etc.
# If your file has some other suffix, you can always change the file name by typing mv file.blah to file.fastq
# This script can only run one file at a time but takes input from the command line (very user friendly).

# I probably didn't think of every error, so it's possible the script won't work for reasons outside what are stated in the directions
# You can email me if you have any questions on how to use the tool! tess.cherlin@students.jefferson.edu

echo ---------------------------------------------------------------------
echo          
echo Hello, this realFasta script will turn your single fastq or one-column sequence file into a fasta file!
echo You can type "[" control+C "]" to quit this script at any time.
echo Make sure to use a file with the following suffix options:
echo .txt .fastq .gz
echo     
echo ----------------------------------------------------------------------------------------
# This is the file variable 
read -p  "Please enter the filename here (include path "if" not in this directory): " fileNAME

# This is a sanity check to make sure the file entered is in the correct format
if [[ $fileNAME = *".txt"* ]] || [[ $fileNAME = *".fastq"* ]] || [[ $fileNAME = *".gz"* ]]; then


    # This part of the code is to turn a fastq file into a fasta file 
    if [[ $fileNAME = *".fastq"* ]] || [[ $fileNAME = *".gz"* ]]; then
        echo We ran realFasta for your fastq file

        prefix=$(ls $fileNAME | sed 's/\.fastq//' | sed 's/\.gz//')
        echo $prefix.txt

        less $fileNAME | awk 'BEGIN{n=0}{if (n%4==1) print; n=n+1;}' > $prefix.fa

        echo Your fasta file is complete it is called: $prefix.fa

        # This part of the code is to turn a one column sequence file into a fasta file
    elif [[ $fileNAME = *".txt"* ]] ; then 

        echo We are going to run realFasta for your file which contains a list of sequences
        prefix2=$(ls $fileNAME | sed 's/\.txt//')
        echo $prefix2.txt
        lineNUMS=$(cat $fileNAME | wc -l )
        echo There are $lineNUMS lines in this file

        x=$(echo $lineNUMS); for ((i=1; i<=x; i++)); do echo $i; done > lineNUMS.txt

        paste lineNUMS.txt $fileNAME | awk '{print ">"$1"\n"$2}' > $prefix2.fa
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
