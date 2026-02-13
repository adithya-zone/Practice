#!/bin/bash
animal=("dog" "cat" "elephant" "tiger")
echo "First animal: ${animal[0]}"
echo "Second animal: ${animal[1]}"
echo "Third animal: ${animal[2]}"
echo "Fourth animal: ${animal[3]}"
echo "All animals: ${animal[@]}"
echo "Total number of animals: ${#animal[@]}"
echo "This is my tenth script which contains array of animals"