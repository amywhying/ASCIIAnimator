#!/bin/bash

# Problem statement: "I want for my computer to draw cute animals for me to make me feel happy." 
# Name of command: myscript 
# Example of its usage: 
# -bash-4.2$ sh myscript.sh 
# "Type one of the following animals: (cat, dog, fish, jumpy fish, wolves)"
# "dog"
#     |\_/|                  
#     | @ @   Woof! 
#     |   <>              _  
#     |  _/\------____ ((| |))
#     |               `--' |   
# ____|_       ___|   |___.' 
#/_/_____/____/_______|
#
# Here is the myScript.sh script that can ask me what type of animal I would
# like it to draw in ASCII characters and then draw them for me. 

# The drawDog function uses a here document to draw a dog in ASCII characters.
drawDog() {

cat << "EOF"
     |\_/|                  
     | @ @   Woof! 
     |   <>              _  
     |  _/\------____ ((| |))
     |               `--' |   
 ____|_       ___|   |___.' 
/_/_____/____/_______|
EOF

}

# The drawJumpyFish function uses a here document to draw a splashing whale in
#  ASCII characters.
drawJumpyFish() {

cat << "EOF"
      .
      ":"
    ___:____      |"\/"|
  ,'        `.     \  /
  |  O        \___/  |
~^~^~^~^~^~^~^~^~^~^~^~^~
EOF

}

# The drawFish function uses a here document to draw a whale in ASCII characters.
drawFish() {

cat << "EOF"
       .
      ":"
    ___:____     |"\/"|
  ,'        `.    \  /
  |  O        \___/  |
~^~^~^~^~^~^~^~^~^~^~^~^~
EOF
}

# The following lines take in user input dictating what type of animal should be drawn. 
echo "Type one of the following animals: (cat, dog, fish, jumpy fish, wolves)"

read animal

# The following while loop guards against fuzzing by ensuring that only 
# valid inputs enter the next phase of the script. 
while [ "$animal" != "cat" ] && [ "$animal" != "dog" ] && [ "$animal" != "fish" ] && [ "$animal" != "jumpy fish" ] && [ "$animal" != "wolves" ]
do
	read animal

done

# The following if else chain determines which type of animal the user has 
# chosen, and outputs a drawing accordingly. 
if [ "$animal" == "cat" ]
then 
	echo " Is the guard guarding his $animal? Or is the cat guarding the guard?:"
	cat << "EOF"
       _,.
     ,` -.)
    '( _/'-\\-.               
   /,|`--._,-^|            ,     
   \_| |`-._/||          ,'|       
     |  `-, / |         /  /      
     |     || |        /  /       
      `r-._||/   __   /  /  
  __,-<_     )`-/  `./  /
 '  \   `---'   \   /  / 
     |           |./  /  
     /           //  /     
 \_/' \         |/  /         
  |    |   _,^-'/  /              
  |    , ``  (\/  /_        
   \,.->._    \X-=/^         
   (  /   `-._//^`  
    `Y-.____(__}              
     |     {__)           
           ()`     
EOF
	printf " /\_/\ \n( o.o )\n > ^ <\n"

elif [ "$animal" == "dog" ]
then
	echo "It's Clifford the big red dog!"
	drawDog

elif [ "$animal" == "jumpy fish" ]
then
# The following block of code essentially "animates" the 2 types of fish 
# drawings by printing them in succession of each other. 
	n="0"
	while [ $n -lt 10 ]
	do
	if [ 0 -eq $(($n % 2)) ]
	then
		echo -e "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" 
		drawFish
	else 
		drawJumpyFish
	fi
	n=$[$n+1]
	sleep 1
	done
elif [ "$animal" == "wolves" ]
then
# The following block of code prints an ASCII drawing from a website. 
	lynx -dump https://www.asciiart.eu/animals/wolves > wolves.html
	sed -n 59,141p wolves.html
	rm wolves.html

else
	echo "Just a $animal chilling :D"
	drawFish
fi
