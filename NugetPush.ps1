$srcPath = ".\src\"
$buildPath = ".\build\"
$versionFile = $srcPath + "SharedAssemblyInfo.cs"
$nuget = ".\tools\nuget\nuget.exe"

get-content $versionFile | where-object { $_ -match '^\[\s*assembly:\s*AssemblyVersion\s*\(\s*\"(?<version>[\d\.]*)\"\s*\)\s*\]' } | out-null

#Simple.Data.PostgreSql
$packageName = "Simple.Data.PostgreSql"
$pushFile = $buildPath + $packageName + "." + $matches.version + ".nupkg"
&$nuget delete $packageName $matches.version -NoPrompt
&$nuget push $pushFile
