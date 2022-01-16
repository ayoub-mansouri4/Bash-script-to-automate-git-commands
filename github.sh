#!/bin/bash

#Developed by AYOUB MANSOURI
#Sun Jan 16 05:29:33 PM +01 2022



git_init(){
      read -p "Path [/home/user/Desktop/*...] ?: " path
      cd $path
      if [ $? -eq 0 -o `pwd`=$path ]
      then
          read -p "Github username ?: " username
          read -p "Repository name ?: " repository
          read -p "Token ?: " token
          git init
          git remote add origin https://github.com/$username/$repository.git
          git branch -M master
          sed -i "s/github.com/$token@github.com/g" .git/config
     else 
        git_init
     fi
}


git_commit(){
  read -p "Path [/home/user/Desktop/*...] ?: " path
  cd $path
  if [ $? -eq 0 -o `pwd`=$path ]
  then
      read -p "Git commit message ?: " msg
      git add .
      git commit -m "$msg"
      git push -u origin master
  else 
      git_commit
  fi
}


GitHub(){
   while true 
   do 
     echo -e "\n - init : press 0\n - commit & push : press 1\n - exit : press 2\n"
     read -p "choice ?: " choice
     if [ $choice -eq 0  ]
     then 
         git_init
     elif [ $choice -eq 1 ]
     then
         git_commit
     elif [ $choice -eq 2 ] 
     then 
         break
     else
         echo -e "\nyour choice is invalid"
         GitHub
     fi
   done

}
GitHub
