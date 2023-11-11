#!/bin/bash
# status=$?
# Keep both stdout and stderr unmolested.
# exec 3>&1 4>&2
# foo=$( { time bar 1>&3 2>&4; } 2>&1 )  # Captures time only.
# exec 3>&- 4>&-

# same thing without exec
# { foo=$( { time bar 1>&3- 2>&4-; } 2>&1 ); } 3>&1 4>&2

# Keep both stdout and stderr unmolested.
# exec 3>&1 4>&2
# foo=$( { time bar 1>&3 2>&4; } 2>&1 )  # Captures time only.
# exec 3>&- 4>&-

# # same thing without exec
# { foo=$( { time bar 1>&3- 2>&4-; } 2>&1 ); } 3>&1 4>&2
# TrialBalance Pipeline stop pipeline on fail

export AccountingYearCategoryTypeError=0 
export MESSAGE="hello"
export prof="hello"
export err="err"
export tm="tm"

# sends err to file and time to $var
exec 3<>error-msg 4<>dbg-msg 5<>error-num 6<>tm-msg 7<>final


    out=$( 
      { tm=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; \
          { 
            # Begin development section
            # Only run this in development platform. Production platform should have all the python modules installed already.
            # eval "$(conda shell.bash hook)";
            # echo "before conda activate base"
            # conda activate etl;
            # End development section
            time source ./AccountingYearCategoryType.sh 2>&3 1>&4; \
            echo "$AccountingYearCategoryTypeError" 1>&5; 
          } 2>&1; 
        );
        echo "$tm" 1>&6; 
      } 
      # } 5>&1 4>&1 3>&1 6>&1;
    );
    echo "$out" 1>&7;
exec 3>&- 4>&- 5>&- 6>&- 7>&-

exec 3<>error-msg 4<>dbg-msg 5<>error-num 6<>tm-msg 7<>final
read -r tm <&6       # read the first 3 characters from fd 5.
# read -n 3 tm <&6       # read the first 3 characters from fd 5.
echo "time=$tm" 

while IFS= read -r emline
do
  em="${em}"$'\n'"${emline}"  
  #  p="${var1}"$'\n'"${var2}"
  # echo "$line"
done <&3
echo "em = $em"

# read -r em <&3       # read the first 3 characters from fd 5.
# # read -n 3 tm <&6       # read the first 3 characters from fd 5.
# echo $em 

# read -r dm <&4       # read the first 3 characters from fd 5.
# # read -n 3 tm <&6       # read the first 3 characters from fd 5.
# echo "dm=$dm"
# dm="hello"
while IFS= read -r line
do
  dm="${dm}"$'\n'"${line}"  
  #  p="${var1}"$'\n'"${var2}"
  # echo "$line"
done <&4
echo "dm = $dm"
read -r error <&5       # read the first 3 characters from fd 5.
# read -n 3 tm <&6       # read the first 3 characters from fd 5.
echo "error=$error"

exec 3>&- 4>&- 5>&- 6>&- 7>&-


# # sends err to file and time to $var
# exec 3<>err 4>&2 5>&1
# var=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; \
# { time source ./AccountingYearCategoryType.sh 1>/dev/null 2>&3; \
#   echo "err=$AccountingYearCategoryTypeError"  1>&3; 
# } 2>&1  )
# echo "var is: $var"
# exec 3>&- 4>&- 5>&-

#  This works
# exec 3>&1 4>&2 5>&1
# var=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; \
# { time source ./AccountingYearCategoryType.sh 1>/dev/null; \
#   echo "[A] AccountingYearCategoryTypeError is: $AccountingYearCategoryTypeError" ; 
# } 2>&1  )
# echo "var is: $var"
# exec 3>&- 4>&- 5>&-

# this works
# var=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; \
# { time source ./AccountingYearCategoryType.sh 1>/dev/null; \
#   echo "[A] AccountingYearCategoryTypeError is: $AccountingYearCategoryTypeError" ; 
# } 2>&1  )
# echo "var is: $var"


# exec 3>&1 4>&2 5>&1
# err=$( { tm=$( { time ./a.sh 1>&3 2>&4; } 2>&1 ); echo $tm; } 3>&1 ); echo $err; # Captures time only.
# echo "tm is $tm"
# exec 3>&- 4>&- 5>&-

# exec 3>&1 4>&2 5>&1
# err=$( { tm=$( { time ./a.sh 1>&3 2>&4; } 2>&1 ); echo $tm; } 3>&1 ); echo $err; # Captures time only.
# exec 3>&- 4>&- 5>&-

# exec 3>&1 4>&2 5>&1
# err=$( { tm=$( { time ./a.sh 1>&3 2>&4; } 2>&1 ); echo $tm; } 3>&1 );  # Captures time only.
# exec 3>&- 4>&- 5>&-

# exec 3>&1 4>&2 5>&1
# { tm=$( { time ./a.sh 1>&3 2>&4; } 2>&1 ); echo $tm 1>&5; }  # Captures time only.
# exec 3>&- 4>&- 5>&-

# exec 3>&1 4>&2 5>&1
# { foo=$( { time ./a.sh 1>&3 2>&4; } 2>&1 ); echo $foo; }  # Captures time only.
# exec 3>&- 4>&- 5>&-

# exec 3>&1 4>&2 5>&1
# foo=$( { time ./a.sh 1>&3 2>&4; } 2>&1 )  # Captures time only.
# exec 3>&- 4>&- 5>&-

# { out=$( { exec 5>&-; tm=$( { TIMEFORMAT='%R'; time ./a.sh 1>&3- 2>&4-; } 2>&1 ); echo $tm; 1>5; } 1>&5 3>&1 4>&2; ); echo $out; }
# { out=$( { tm=$( { TIMEFORMAT='%R'; time ./a.sh 1>&3- 2>&4-; } 2>&1 ); echo $tm; } 3>&1 4>&2; ); echo $out; }
# { foo=$( { TIMEFORMAT='%R'; time ./a.sh 1>&3- 2>&4-; } 2>&1 ); echo $foo; } 3>&1 4>&2; 

# { foo=$( { time ./a.sh 1>&3- 2>&4-; } 2>&1 ); echo $foo; } 3>&1 4>&2; 

# { foo=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; { time source ./AccountingYearCategoryType.sh 1>&3- 2>&4-; } 2>&1 ); } 3>&1 4>&2

# http://mywiki.wooledge.org/BashFAQ/032

# var=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; \
# { time source ./AccountingYearCategoryType.sh 1>/dev/null; \
#   echo "[A] AccountingYearCategoryTypeError is: $AccountingYearCategoryTypeError" ; 
# } 2>&1  )
# echo "var is: $var"

# err=$({ var=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; \
# { time source ./AccountingYearCategoryType.sh 1>&3- 2>&4-; \
#   echo "[A] AccountingYearCategoryTypeError is: $AccountingYearCategoryTypeError" ; 
# } 2>&1;  ); } 3>&1 4>&2; );  
# echo "var is: $var"
# echo "err is: $err"


# export AccountingYearCategoryTypeError=0 
# export MESSAGE="hello"

# { var=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; \
# { time source ./AccountingYearCategoryType.sh 1>&3- 2>&4-; \
#   echo "[A] AccountingYearCategoryTypeError is: $AccountingYearCategoryTypeError" ; 
# } 2>&1  ); } 3>&1 4>&2 
# echo "var is: $var"
# echo "[A] AccountingYearCategoryTypeError is: $AccountingYearCategoryTypeError"

# export AccountingYearCategoryTypeError=0 
# export MESSAGE="hello"

# var=$( cd ./AccountingYearCategoryType; TIMEFORMAT='%R'; \
# { time source ./AccountingYearCategoryType.sh 1>/dev/null; \
#   echo "[A] AccountingYearCategoryTypeError is: $AccountingYearCategoryTypeError" ; 
# } 2>&1  )
# echo "var is: $var"
# echo "[A] AccountingYearCategoryTypeError is: $AccountingYearCategoryTypeError"
