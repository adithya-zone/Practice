#!/bin/bash
for name in adithya subhan surendra
do 
echo "Good Morning $name"
done
=======================================
#!/bin/bash
correct=0
while [ $correct -lt 5 ]
do
    echo "Correct answers so far: $correct"
    correct=$((correct + 1))
done
=======================================
#!/bin/bash
age=0
until [ $age -eq 5 ]
do
    echo "I am $age years old, waiting to be 5"
    age=$((age + 1))
done
echo "Yay! I am 5 years old now"
=======================================