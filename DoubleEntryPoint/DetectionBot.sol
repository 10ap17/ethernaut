// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IForta {
    function setDetectionBot(address detectionBotAddress) external;
    function notify(address user, bytes calldata msgData) external;
    function raiseAlert(address user) external;
}
contract DetectionBot{
    IForta forta;
    constructor(IForta _forta){
        forta=_forta;

    }
    function handleTransaction(address user, bytes calldata msgData)external{
        forta.notify(user, msgData);
        forta.raiseAlert(user);
    }
}