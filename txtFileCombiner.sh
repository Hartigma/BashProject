# This portion is the options menu, this allows us to continue with the scipt

#reused this script from the last lab however it is very helpful in terms of menu making
function display_usage() {
    echo "Usage: ./txtFileCombiner.sh -(r,e,h)"
    echo: "Choose: "
    echo "  -r: Repeats options."
    echo "  -e: exit with no explanation"
    echo "  -h: explains and continues the script"
}

#This option is used to repeat the menu
if [[ $# -eq 0 || "$1" == "-r" ]]; then
    display_usage
    exit 0
fi

# This exits the script
if [[ "$1" == "-e" ]]; then
  echo "Exiting Script"
  exit 0
fi

#This explains the script then finishes the process. I incluided formatting to help it visually.
if [[ "$1" == "-h" ]]; then
  echo "
  This directory contains Paper1.txt and Paper2.txt. Combining will now begin."
  echo "Paper 1 & Paper 2 individually identify which paper they are; by combining, we will get both at once.
  
  "
fi

# This acts as the else if if you choose an option that is not provided, this will call you out and recycle you back to the start. This is not a loop since there were so few options. I found this to be more convieinit for my use case.
if [[ "$1" != "-r" && "$1" != "-e" && "$1" != "-h" ]]; then
echo " 
This is not an input that is accepted '$1' is not a real option please stick to the three provided.
"
display_usage
exit 1
fi

# This is the input, this allows us to identify and combine the two text files. This also pulls on the date
InputTXT1="Paper1.txt"
InputTXT2="Paper2.txt"
OutputCOMBINED="Combined.txt"
changeDATE=$(date +"%Y-%m-%d")

# This clears the file if its already been created so this can be done indefinite times.
> "$OutputCOMBINED"

# This checks if the file exists and if it does, the ">>" will basically not overwrite the file but instead it will add it to the file. Our file is blank so itll get both of the inputs"
if [ -e "$InputTXT1" ]; then
    cat "$InputTXT1" >> "$OutputCOMBINED"
fi

if [ -e "$InputTXT2" ]; then
    cat "$InputTXT2" >> "$OutputCOMBINED"
fi

#This displays the results of the file so you dont have to click into it
echo "Combination results: "
cat $OutputCOMBINED

#declares when the file wash changed as a representative date, this can be used to screenshot or document however you so choose
echo This file was changed on: $changeDATE