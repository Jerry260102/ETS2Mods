Function Get-Folder($initialDirectory) {
    [void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
    $FolderBrowserDialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $FolderBrowserDialog.RootFolder = 'MyComputer'
    if ($initialDirectory) { $FolderBrowserDialog.SelectedPath = $initialDirectory }
    if ($FolderBrowserDialog.ShowDialog() -eq 'OK') {
        return $FolderBrowserDialog.SelectedPath
    } else {throw}
}
$directory = Get-Folder(pwd)
$filename = $directory.split('\')[-1]+'.scs'
echo "Creating $filename file"
.\scs_packer.exe create $filename -root $directory