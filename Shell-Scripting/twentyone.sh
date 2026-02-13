#!/bin/bash
echo "heello" > file.txt
cat file.txt
echo "how are you" >> file.txt
cat file.txt
pwdd 2> file.txt
cat file.txt
pwdd 2>> file.txt
cat file.txt
echo "this is my redirections demo"  &> file.txt
cat file.txt
pwdd &>> file.txt
cat file.txt

==========================================================
#!/bin/bash
echo -e "\e[31mthis is red color text"
echo -e "\e[32mthis is green color text"
echo -e "\e[33mthis is yellow color text"