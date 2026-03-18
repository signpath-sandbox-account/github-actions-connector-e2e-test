
[CmdletBinding()] 
Param (
    [Parameter(Mandatory)] [Int] $SizeMB,
    [Parameter(Mandatory)] [string] $OutputFile
)

# 1 KB buffer of random data
$private:bufferSize = "1KB"
$private:buffer = New-Object byte[] $bufferSize
$private:rng = [System.Security.Cryptography.RandomNumberGenerator]::Create()

$private:fs = [System.IO.File]::Open($OutputFile, [System.IO.FileMode]::Create)

try {
    for ($i = 0; $i -lt ($SizeMB * 1024); $i++) {
        $rng.GetBytes($buffer)
        $fs.Write($buffer, 0, $buffer.Length)
    }
}
finally {
    $fs.Close()
    $rng.Dispose()
}

Write-Host "Generated executable artifact '$OutputFile' of size $SizeMB MB"
