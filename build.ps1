echo Downloading packages...

$package = "bootstrap-3.3.6-dist"

wget -OutFile nuget.exe https://dist.nuget.org/win-x86-commandline/v3.3.0/nuget.exe
wget -OutFile $package.zip https://github.com/twbs/bootstrap/releases/download/v3.3.6/bootstrap-3.3.6-dist.zip

echo Uncompressing package

& 'C:\Program Files\7-Zip\7z.exe' x -y $package.zip

echo Building NuGet package...

mkdir pkg\lib
mkdir pkg\tools
mkdir pkg\content
mkdir pkg\content\Scripts
mkdir pkg\content\Scripts\Bootstrap

cp -Recurse -Force $package\* pkg\content\Scripts\Bootstrap

.\nuget.exe pack pkg\SyntaxHighlighter.NuGet.nuspec

