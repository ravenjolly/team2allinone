To clone this repo:


git clone --recurse-submodules https://github.com/ravenjolly/team2allinone.git


the --recurse-submodules is very important otherwise the other repos will not clone
be sure to use your token when it asks for password
it will probably ask 2 or 3 times to log in so be prepared.



to run a script prefix the name with "./"

the bash scripts are simply just a list of commands to execute one after the other.

DO NOTE THAT IT TAKES MAYBE 2-3 MINUTES FOR THE BACKENDS TO FULLY BE "awake"
SO IF YOU GET ERROR 502 WAIT A BIT LONGER


./build_all.sh 		-> Builds the three images for docker to use
./start_containers.sh 	-> Will start all three containers and attach them to networks
./stop_containers.sh    -> Will stop all three containers and remove the network
./reset.sh 		-> Will completely stop and remove all images/containers.... docker system prune -a

to run via compose

docker compose build 	-> Does everything in the start_containers script for you
docker compose up -d    -> Starts everything. 
docker compose down	-> Stops everything.


Example usage

./build_all.sh
./start_containers.sh

when done
./stop_containers


via compose
docker compose build
docker compose up -d

when done
docker compose down
./reset.sh
