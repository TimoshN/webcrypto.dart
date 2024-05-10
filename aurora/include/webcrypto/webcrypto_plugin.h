/**
 * SPDX-FileCopyrightText: Copyright 2023 Open Mobile Platform LLC <community@omp.ru>
 * SPDX-License-Identifier: BSD-3-Clause
 */
#ifndef FLUTTER_PLUGIN_WEBCRYPTO_PLUGIN_H
#define FLUTTER_PLUGIN_WEBCRYPTO_PLUGIN_H

#include <flutter/plugin-interface.h>

#ifdef PLUGIN_IMPL
#define PLUGIN_EXPORT __attribute__((visibility("default")))
#else
#define PLUGIN_EXPORT
#endif

class PLUGIN_EXPORT WebcryptoPlugin final : public PluginInterface
{
public:
    void RegisterWithRegistrar(PluginRegistrar &registrar) override;

private:
    void onMethodCall(const MethodCall &call);
    void onGetPlatformVersion(const MethodCall &call);
    void unimplemented(const MethodCall &call);
};

#endif /* FLUTTER_PLUGIN_WEBCRYPTO_PLUGIN_H */
