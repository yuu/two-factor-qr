require 'rotp'
require 'rqrcode'
require 'rqrcode_png'

secret = ''
issuer = ''
account = ''
totp   = ROTP::TOTP.new(secret, issuer: issuer)
uri    = totp.provisioning_uri(account)

qr     = RQRCode::QRCode.new(uri, size: 12)
png    = qr.as_png.resize(500, 500)
png.save("2fa.png")
