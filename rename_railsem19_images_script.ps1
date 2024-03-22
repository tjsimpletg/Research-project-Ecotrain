$folderPath = "C:\Users\tjsim\Downloads\rs19_val"

$files = Get-ChildItem -Path $folderPath -Filter "rs*.jpg"


foreach ($file in $files) {
    # Extract the numerical part of the filename (e.g., '00000' from 'rs00000.jpg')
    $numberPart = $file.Name -replace "rs", "" -replace ".jpg", ""
    
    $newNumberPart = [int]$numberPart
    
    # Define the new filename (e.g., '0.jpg')
    $newFileName = "$newNumberPart.jpg"
    
    $newFilePath = Join-Path -Path $folderPath -ChildPath $newFileName
    
    # Rename the file
    Rename-Item -Path $file.FullName -NewName $newFilePath
}

Write-Host "Renaming completed."
