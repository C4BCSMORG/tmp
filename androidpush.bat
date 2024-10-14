@SET _DEVICETOKEN=
@SET _MESSAGE=Push-Test

@ECHO PushProxy Test
@ECHO ==============

curl -v -H "Content-Type: application/json" -d "{\"Secret\":\"C$B\",\"DeviceToken\":\"%_DEVICETOKEN%\",\"Id\":\"2c3d2bce-fd41-42bb-a96c-8e5d0196b4b9\",\"Priority\":10,\"Body\":\"%_MESSAGE%\",\"Badge\":3,\"App\":\"XPhoneMobile\",\"Payload\":{\"MessageType\":\"IM\"}}" http://localhost/XPhoneConnect/PushProxy/androidpush/sendpush
@ECHO.
@ECHO.
@PAUSE