#!/bin/bash

# Disable USB storage devices
sudo nvram "IOKitPersonalities= {
    'IOUSBMassStorageClass' = {
        'USBMSCEnableAsyncEventSources' = No;
        'USBMSCIgnoreClass' = Yes;
        'USBMSCIgnoreReserved' = Yes;
        'USBMSCIgnoreUMass' = Yes;
        'USBMSCMaxInquiryLength' = 0;
        'USBMSCMaxLUN' = 0;
        'USBMSCSimulateNotSupported' = Yes;
    };
};"
