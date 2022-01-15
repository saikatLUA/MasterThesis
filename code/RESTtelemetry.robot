*** Variables ***
${interface}=   http://localhost/rest
*** Settings ***
Documentation    This Test Suite checks and validate the wallbox information via REST interface from app. Please upgrade the REST library "pip install --upgrade RESTinstance".
Resource          ../resources/mqtt.robot
Library           String
Library           OperatingSystem
Library           Collections
Library             Process
Library           REST   ${interface}   ssl_verify=False
Test Setup          Connect to a broker with default port
Test Teardown       Disconnect



*** Test Cases ***
remote GET /rest/v1/cp0/telemetry
    [Tags]  refEnum
    GET         /v1/cp0/telemetry
    Integer     response status             200
    String      response body id            /rest/v1/cp0/telemetry
    String      response body type          wbTelemetry
    Object      response body               required=["references"]

remote GET /rest/v1/cp0/telemetry/meter
    [Tags]      meter
    Publish      topic=0/power/t/meter   message=561    retain=True

    GET         v1/cp0/telemetry/meter
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/meter
    String      response body type         stringValue
    String      response body value         561
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/meter
    #WriteCheck, Should not be published
    PUT      /v1/cp0/telemetry/meter    { "value": "PublishNot" }
    ${meter}=    Subscribe    topic=0/power/t/meter  qos=2
    Log To Console  ${meter[0]}
    Should not be Equal     ${meter[0]}     PublishNot

#remote GET /rest/v1/cp0/telemetry/meter/power
#    [Tags]      power
#    Publish      topic=0/power/t/meter   message=48376   retain=True
#
#   GET         v1/cp0/telemetry/meter/power
#   Integer     response status            200
#    String      response body id           /rest/v1/cp0/telemetry/meter/power
#    String      response body type         stringValue
#    String      response body value         48376
#    Integer      response body writeable    0

#remote PUT /rest/v1/cp0/telemetry/meter/power
#    #WriteCheck, Should not be published
#    PUT      /v1/cp0/telemetry/meter/power    { "value": "PublishNot" }
#    ${power}=    Subscribe    topic=0/power/t/meter  qos=2
#    Log To Console  ${power[0]}
#    Should not be Equal     ${power[0]}     PublishNot

#remote GET /rest/v1/cp0/telemetry/meter/energy
#    [Tags]      energy
#    Publish      topic=0/power/t/meter   message=48314    retain=True
#    GET         v1/cp0/telemetry/meter/energy
#    Integer     response status            200
#    String      response body id           /rest/v1/cp0/telemetry/meter/energy
#    String      response body type         stringValue
#    String      response body value         48314
#    Integer      response body writeable    0

#remote PUT /rest/v1/cp0/telemetry/meter/energy
#    #WriteCheck, Should not be published
#    PUT      /v1/cp0/telemetry/meter/energy    { "value": "PublishNot" }
#    ${energy}=    Subscribe    topic=0/power/t/meter  qos=2
#    Log To Console  ${energy[0]}
#    Should not be Equal     ${energy[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/meterSource
    [Tags]      meterSource
    Publish      topic=0/power/t/meterSource/config   message=4836    retain=True

    GET         v1/cp0/telemetry/meterSource
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/meterSource
    String      response body type         stringValue
    String      response body value         4836
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/meterSource
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/meterSource    { "value": "PublishNot" }
    ${meterSource}=    Subscribe    topic=0/power/t/meterSource/config  qos=2
    Log To Console  ${meterSource[0]}
    Should not be Equal     ${meterSource[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/sensor
    [Tags]      sensor
    Publish      topic=0/power/t/sensor   message=123    retain=True

    GET         v1/cp0/telemetry/sensor
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/sensor
    String      response body type         stringValue
    String      response body value         123
    Integer     response body writeable    0

remote PUT /rest/v1/cp0/telemetry/sensor
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/sensor    { "value": "PublishNot" }
    ${sensor}=    Subscribe    topic=0/power/t/sensor  qos=2
    Log To Console  ${sensor[0]}
    Should not be Equal     ${sensor[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/temp
    [Tags]      telemetry/temp
    Publish      topic=0/power/t/temp   message=testValueCheck   retain=True

    GET         v1/cp0/telemetry/temp
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/temp
    String      response body type         stringValue
    String      response body value         testValueCheck
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/temp
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/temp    { "value": "PublishNot" }
    ${temp}=    Subscribe    topic=0/power/t/temp  qos=2
    Log To Console  ${temp[0]}
    Should not be Equal     ${temp[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/phases
    [Tags]      telemetry/phases
    Publish      topic=0/power/t/phases   message=testPhases   retain=True

    GET         v1/cp0/telemetry/phases
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/phases
    String      response body type         stringValue
    String      response body value         testPhases
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/phases
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/phases    { "value": "PublishNot" }
    ${phases}=    Subscribe    topic=0/power/t/phases  qos=2
    Log To Console  ${phases[0]}
    Should not be Equal     ${phases[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/limit
    [Tags]      telemetry/limit
    Publish      topic=0/power/t/limit   message=testlimit   retain=True

    GET         v1/cp0/telemetry/limit
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/limit
    String      response body type         stringValue
    String      response body value         testlimit
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/limit
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/limit    { "value": "PublishNot" }
    ${limit}=    Subscribe    topic=0/power/t/limit  qos=2
    Log To Console  ${limit[0]}
    Should not be Equal     ${limit[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/limiter
    [Tags]      telemetry/limiter
    Publish      topic=0/power/t/limiter   message=testlimiter   retain=True

    GET         v1/cp0/telemetry/limiter
    Integer     response status             200
    String      response body id            /rest/v1/cp0/telemetry/limiter
    String      response body type          stringValue
    String      response body value         testlimiter
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/limiter
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/limiter    { "value": "PublishNot" }
    ${limiter}=    Subscribe    topic=0/power/t/limiter  qos=2
    Log To Console  ${limiter[0]}
    Should not be Equal     ${limiter[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/wbState
    [Tags]      telemetry/wbState
    Publish      topic=0/power/t/wbState   message=testwbState   retain=True

    GET         v1/cp0/telemetry/wbState
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/wbState
    String      response body type         stringValue
    String      response body value         testwbState
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/wbState
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/wbState    { "value": "PublishNot" }
    ${wbState}=    Subscribe    topic=0/power/t/wbState  qos=2
    Log To Console  ${wbState[0]}
    Should not be Equal     ${wbState[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/chargePermission
    [Tags]      telemetry/chargePermission
    Publish      topic=0/power/t/chargePermission   message=testchargePermission   retain=True

    GET         v1/cp0/telemetry/chargePermission
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/chargePermission
    String      response body type         stringValue
    String      response body value         testchargePermission
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/chargePermission
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/chargePermission    { "value": "PublishNot" }
    ${chargePermission}=    Subscribe    topic=0/power/t/chargePermission  qos=2
    Log To Console  ${chargePermission[0]}
    Should not be Equal     ${chargePermission[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/chargingTime
    [Tags]      telemetry/chargingTime
    Publish      topic=0/power/t/chargingTime   message=testchargingTime  retain=True

    GET         v1/cp0/telemetry/chargingTime
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/chargingTime
    String      response body type         stringValue
    String      response body value         testchargingTime
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/chargingTime
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/chargingTime    { "value": "PublishNot" }
    ${chargingTime}=    Subscribe    topic=0/power/t/chargingTime  qos=2
    Log To Console  ${chargingTime[0]}
    Should not be Equal     ${chargingTime[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/chargingStart
    [Tags]      telemetry/chargingStart
    Publish      topic=0/power/t/chargingStart   message=testchargingStart  retain=True

    GET         v1/cp0/telemetry/chargingStart
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/chargingStart
    String      response body type         stringValue
    String      response body value         testchargingStart
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/chargingStart    
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/chargingStart    { "value": "PublishNot" }
    ${chargingStart}=    Subscribe    topic=0/power/t/chargingStart  qos=2
    Log To Console  ${chargingStart[0]}
    Should not be Equal     ${chargingStart[0]}     PublishNot

remote GET /rest/v1/cp0/telemetry/failureState
    [Tags]      telemetry/failureState
    Publish      topic=0/power/t/failureState/failureCollector   message=testfailureState  retain=True

    GET         v1/cp0/telemetry/failureState
    Integer     response status            200
    String      response body id           /rest/v1/cp0/telemetry/failureState
    String      response body type         stringValue
    String      response body value         testfailureState
    Integer      response body writeable    0

remote PUT /rest/v1/cp0/telemetry/failureState
    #WriteCheck, Should not be published
    PUT      /rest/v1/cp0/telemetry/failureState    { "value": "PublishNot" }
    ${failureState}=    Subscribe    topic=0/power/t/failureState/failureCollector  qos=2
    Log To Console  ${failureState[0]}
    Should not be Equal     ${failureState[0]}     PublishNot