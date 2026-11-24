# Requires PowerShell 7. Run once per checkout to provision the local TLS endpoint.
# The private key stays on the workstation. Rebuild the APK after provisioning.
$ErrorActionPreference = 'Stop'
$root = Split-Path $PSScriptRoot
$state = Join-Path $PSScriptRoot '.tls'
if (Test-Path $state) { throw "TLS material already exists in $state. Reuse the existing endpoint." }
$key = [Security.Cryptography.RSA]::Create(2048)
try {
    $req = [Security.Cryptography.X509Certificates.CertificateRequest]::new(
        'CN=localhost', $key, [Security.Cryptography.HashAlgorithmName]::SHA256,
        [Security.Cryptography.RSASignaturePadding]::Pkcs1)
    $san = [Security.Cryptography.X509Certificates.SubjectAlternativeNameBuilder]::new()
    $san.AddDnsName('localhost')
    $req.CertificateExtensions.Add($san.Build())
    $req.CertificateExtensions.Add([Security.Cryptography.X509Certificates.X509BasicConstraintsExtension]::new($false, $false, 0, $true))
    $cert = $req.CreateSelfSigned([DateTimeOffset]::UtcNow.AddDays(-1), [DateTimeOffset]::UtcNow.AddYears(2))
    $pin = [Convert]::ToBase64String([Security.Cryptography.SHA256]::HashData($key.ExportSubjectPublicKeyInfo()))
    New-Item -ItemType Directory $state | Out-Null
    [IO.File]::WriteAllText((Join-Path $state 'key.pem'), $key.ExportPkcs8PrivateKeyPem())
    $raw = Join-Path $root 'app/src/main/res/raw'
    New-Item -ItemType Directory -Force $raw | Out-Null
    [IO.File]::WriteAllText((Join-Path $raw 'lab_server.pem'), $cert.ExportCertificatePem())
    $config = Join-Path $root 'app/src/main/res/xml/network_security_config.xml'
    [xml]$xml = Get-Content -Raw $config
    $xml.SelectSingleNode('//domain-config/pin-set/pin').InnerText = $pin
    $xml.Save($config)
    Write-Output "Provisioned localhost. SPKI SHA-256 $pin"
} finally {
    $key.Dispose()
}
