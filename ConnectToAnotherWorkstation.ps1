set-executionpolicy unrestricted

$connectionComputer = Read-Host -Prompt "Hello, what computer would you like to connect to?"

$cred = get-credential 

Enter-PSSession $connectionComputer -Credential $cred


