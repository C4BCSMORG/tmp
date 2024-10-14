@SET _DEVICETOKEN=
@SET _MESSAGE=Push-Test

@ECHO PushProxy Test
@ECHO ==============

curl -v -H "Content-Type: application/json" -d "{\"DeviceToken\":\"%_DEVICETOKEN%\",\"Payload\":\"{\\\"aps\\\":{\\\"alert\\\":\\\"%_MESSAGE%\\\",\\\"sound\\\":\\\"default\\\",\\\"badge\\\":10},\\\"data\\\":{\\\"MessageType\\\":\\\"IM\\\"}}\",\"Id\":\"2c3d2bce-fd41-42bb-a96c-8e5d0196b4b9\",\"PushType\":1,\"Topic\":\"com.c4b.mxphoneconnect\",\"Priority\":10,\"Secret\":\"C$B\"}" http://localhost/XPhoneConnect/PushProxy/applepush/sendpush
@ECHO.
@ECHO.
@PAUSE