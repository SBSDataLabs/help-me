messing around with the permissions on petes machines. 
I used this when i executed some git commands as super user, and then couldnt access certain files when executing again as iotaml

First get ownership of the directory and its contents back
```
> sudo chown -R iotaml iota-ml-python-scripts/
> sudo chgrp -R iotaml iota-ml-python-scripts/

as the super user do: change ownership (recursively) to iotaml on the directory iota-ml-python-scripts
       ^     ^    ^^  ^^     ^^^        ^               ^^^^^^                  ^^^^^^^^^^^^^^^^^^^^^^
```

Then put the permissions back to somethign youre comfortable with: 
```
> chmod -R u+rwx iota-ml-python-scripts/
> chmod -R g+rwx iota-ml-python-scripts/
> chmod -R o+rx iota-ml-python-scripts/

change mode (recursively) of user/group/other, add permission read write execute on directory iota-ml-python-scripts
^^     ^^^   ^               ^    ^     ^      ^^^            ^    ^     ^                    ^^^^^^^^^^^^^^^^^^^^^^
```
