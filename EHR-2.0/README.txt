QuadraCrypto:

Name: Anamta Ansari
CWID: 884449471
Email: anamtaansari@csu.fullerton.edu

Name: Anisha Singh
CWID: 885159103
Email: anisha.singh@csu.fullerton.edu

Name: Prajwal Chavan
CWID: 885154344
Email: prajwalc2107@csu.fullerton.edu

Name: Kishore Shankar
CWID: 885237651
Email: kishorehankar@csu.fullerton.edu

---------------------------------------------

prerequisites:

Node JS : https://nodejs.org/en/download/ 
Python: https://www.python.org/downloads/
IPFS : https://dist.ipfs.tech/#go-ipfs 
angular: npm install -g @angular/cli
truffle: npm install -g truffle      if failed run :  npm install -g truffle@5.4.29

download and install git if not installed.
git: https://git-scm.com/downloads


open CMD in Server Directory 

```
python -m pip install -r requirements.txt
python manage.py migrate
python manage.py run server

```

open GANACHE and import project 
open CMD in the Client Directory

```
npm install --force
truffle migratenpm start

```

setup metamask before opening the project

open: http://localhost:4200/

**** CLEARING THE SERVER  AND CLIENT ***
in Server dir:python manage.py flush
in CLient :truffle migrate




```

IPFS Configuration

"Access-Control-Allow-Headers": [
      "X-Requested-With",
      "Access-Control-Expose-Headers",
      "Range"
   ],
   "Access-Control-Expose-Headers": [
      "Location",
      "Ipfs-Hash"
   ],
   "Access-Control-Allow-Methods": [
      "POST",
      "GET"
   ],
   "Access-Control-Allow-Origin": [
      "*"
   ],
   "X-Special-Header": [
      "Access-Control-Expose-Headers: Ipfs-Hash"
   ]