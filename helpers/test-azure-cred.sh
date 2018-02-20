# Check for ~/.azure/credentials
if [ ! -f ~/.azure/credentials ]; then
   echo "Please create a service principal and the credentials file as described on https://cda.ms/bx"
   exit 2
fi