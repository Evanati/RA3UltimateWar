param(
    [Parameter(Mandatory=$true)]
    [string]$SearchFor,

    [string]$Root = "."
)

Get-ChildItem -Path $Root -Recurse -File -Include *.xml, *.xsd |
    Select-String -Pattern $SearchFor -SimpleMatch |
    ForEach-Object {
        "{0}:{1}: {2}" -f $_.Path, $_.LineNumber, $_.Line.Trim()
    }