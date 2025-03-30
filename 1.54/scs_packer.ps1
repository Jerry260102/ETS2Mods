Function Get-Folder($initialDirectory) {
    [void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
    $FolderBrowserDialog = New-Object System.Windows.Forms.FolderBrowserDialog
    $FolderBrowserDialog.RootFolder = 'MyComputer'
    if ($initialDirectory) { $FolderBrowserDialog.SelectedPath = $initialDirectory }
    if ($FolderBrowserDialog.ShowDialog() -eq 'OK') {
        return $FolderBrowserDialog.SelectedPath
    } else {throw}
}
$directory = Get-Folder("$(pwd)\_WIP")
$filename = $directory.split('\')[-1]+'.scs'
.\scs_packer.exe create $filename -root $directory
pause