echo "Setting up node"
bash ./deployment/setup.sh;

echo "Copying config"
#Copy the config
cp ./deployment/config.dev.py config.py

#Exporting necessary environment variables
echo "Setting up environment variables for permissions"

echo "Copying env vars to .env"
declare -a env_vars=(
 "DEVELOP_GOOGLE_CAL_ID"
 "DEVELOP_GOOGLE_CAL_API_KEY"
 "DEVELOP_SPARKPOST_KEY"
 "DEVELOP_MAPS_API_KEY"
 "DEVELOP_DB_URI"
 "DEVELOP_JWT_SECRET"
 "DEVELOP_JWT_ALGO"
 "DEVELOP_SLACK_API_TOKEN"
 "DEVELOP_SLACK_CHANNEL_ID"
 "DEVELOP_RESUME_BUCKET"
 "DEVELOP_WAIVER_BUCKET"
 "DEVELOP_AWS_ACCESS_KEY_ID"
 "DEVELOP_AWS_SECRET_ACCESS_KEY")
 
echo "For loop"
# Disabled environment variables:
# "DEVELOP_MAX_REIMBURSE"
# "DEVELOP_TRAIN_REIMBURSE"
# "DEVELOP_TRAVEL_BUDGET"
# "DEVELOP_CAR_REIMBURSE"
# "DEVELOP_BUS_REIMBURSE"
# "DEVELOP_PLANE_REIMBURSE"
## now loop through the above env_vars
for i in "${env_vars[@]}"
do
   echo -e "$i=\c" >> .env.dev
   printenv $i >> .env.dev
done

# Deploying!
echo "Deploying!"
npx serverless deploy --stage dev 