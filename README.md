# superFasta
Simple scripts to make fasta files for downstream bioinformatics tools


superFasta README file


Welcome! My name is Tess, and I am a PhD student who finds myself needing to quickly make fasta files for sequences I am analyzing.
I got tired of doing this independently every time I wanted to make a fasta file, so I wrote this cute little script.
You can email me if you have any questions on how to use the tool! tess.cherlin@students.jefferson.edu

There are two scripts here:
1. superFasta.sh -- this reads in a individial file (fastq or single-column sequence) and turns them into a fasta file.
2. superFasta2.sh -- this reads in a list file which contains a list of fastq files or a list of single-column sequence files and turns them into fasta files.

------------------------------------------------------------------------------------------------------------------------------------------------------------
1. superFasta.sh -- for individual files
-----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------
|Before you begin|
----------------
Make sure your files are in the following formats and have the following suffixes
A. fastq format -- .fastq or .fastq.gz
B. one-column sequence format -- .txt

If your files do not have these suffixes but they are the correct formats, you can change them by using the move (mv) command in the command line.

EXAMPLE

mv file.SUFFIX file.txt  [RETURN]
mv file.SUFFIX file.fastq [RETURN]

Run the following command on the command line to make the script executable

chmod +x realFasta.sh [RETURN]

----------------
|   Run script   |
----------------
Run the following command on the command line to make the script executable

chmod +x realFasta.sh [RETURN]

Run the following command on the command line to initiate the script

./realFasta2.sh [RETURN]

The script will ask you for your file. Your files must be in the formats listed
A. fastq format -- .fastq or .fastq.gz 
B. one-column sequence format -- .txt

You can practice running this script with the sample files included
SAMPLE.fastq
SAMPLE.txt
---------------- 
|    Results     | 
----------------  
If all runs correctly your fasta file should be in the same directory as this script

INPUT
file.txt

OUTPUT
file.fa

Now you're good to go!!!

----------------------------------------------------------------------------------------------------------------------------------------------------------
2. superFasta2.sh -- for list of files
---------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------
|Before you begin|
    -----------------
Make sure you have a list of files all in the same file format (fastq or one-column sequence files)

If you need to make a list of files you can run one of the two commands below.

ls File1.txt File2.txt File3.txt File4.txt File5.txt > File_list.txt [RETURN]

    or 

ls File*.txt > File_list.txt [RETURN]

^the * above is a wild-card flag so you can include all the files you have that have that prefix. You can play around with where you put the *

----------------
|   Run script   |
 ----------------
Run the following command on the command line to make the script executable

chmod +x realFasta2.sh [RETURN]

Run the following command on the command line to initiate the script

./realFasta2.sh [RETURN]

The script will ask you for your list file (in .txt format).
The script read through your file list and create a fasta file for each. 

---------------- 
|    Results     |      
---------------- 
If all runs correctly your fasta files should be in the same directory as this script 

INPUT
File_list.txt

OUTPUT
File1.fa
File2.fa
File3.fa
File4.fa
File5.fa

Now you're good to go!!!

    YAY!


