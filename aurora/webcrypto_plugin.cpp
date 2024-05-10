/**
 * SPDX-FileCopyrightText: Copyright 2023 Open Mobile Platform LLC <community@omp.ru>
 * SPDX-License-Identifier: BSD-3-Clause
 */
#include <webcrypto/webcrypto_plugin.h>
#include <flutter/method-channel.h>
#include <flutter/platform-methods.h>
#include <sys/utsname.h>

namespace PlatformVersion {

constexpr auto Version = "Aurora";

}

void WebcryptoPlugin::RegisterWithRegistrar(PluginRegistrar &registrar)
{
    registrar.RegisterMethodChannel("webcrypto",
                                    MethodCodecType::Standard,
                                    [this](const MethodCall &call) { this->onMethodCall(call); });
}

void WebcryptoPlugin::onMethodCall(const MethodCall &call)
{
    const auto &method = call.GetMethod();

    if (method == "getPlatformVersion") {
        onGetPlatformVersion(call);
        return;
    }

    unimplemented(call);
}

void WebcryptoPlugin::onGetPlatformVersion(const MethodCall &call)
{
    call.SendSuccessResponse(PlatformVersion::Version);
}

void WebcryptoPlugin::unimplemented(const MethodCall &call)
{
    call.SendSuccessResponse(nullptr);
}
