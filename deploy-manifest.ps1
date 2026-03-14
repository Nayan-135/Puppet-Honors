param(
    [Parameter(Mandatory=$true)]
    [string]$ManifestFile
)

# Ensure the manifest file exists
if (-not (Test-Path $ManifestFile)) {
    Write-Error "Manifest file '$ManifestFile' not found."
    exit 1
}

# Copy the manifest content to site.pp
Copy-Item -Path $ManifestFile -Destination "site.pp" -Force

Write-Host "Manifest '$ManifestFile' deployed to site.pp. Run 'puppet agent -t' on the agent to apply."