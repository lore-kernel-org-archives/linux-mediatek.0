Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC062C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 07:46:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A2760E94
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 07:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82A2760E94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfTa1fvRjuLrXucRVg7VUFXCbWUOnM2ReolY9qTO+vg=; b=HN5P0xv3lI1umn
	o/sp4rdypBxAS2eGWVyhmACYm6umNz5wgaaTXAJotOfjmcmQUfjfZOkn2Jrc/MrSr3mKfixxJcDtx
	9sxf2vC0VI9vnE4CvKXjOpt8YpEba7Df846jfT4sGzWSQEDQstH9G1bQAVDVqMfbZ/7QDfTyHdw+F
	RtHGxEn0WEyAk3BEiE3vgdpqp+P28jCJR68XRXJe1hNhWZDudVtq3H/xGuSWvna6LHOS5nI2/1sju
	Xf2H5q8KkNo+StLp7OlnEcJhvX9iURS/Blpf1fwW2IMwciRZK4iPAD+bpv2ycpwwiriMDA40JEYmy
	40zqVtlGQIYw1eyzn0Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTftz-00DMq9-KF; Fri, 24 Sep 2021 07:45:47 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTftv-00DMoS-UH
 for linux-mediatek@lists.infradead.org; Fri, 24 Sep 2021 07:45:46 +0000
Received: by mail-lf1-x131.google.com with SMTP id y28so36454581lfb.0
 for <linux-mediatek@lists.infradead.org>; Fri, 24 Sep 2021 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6r3n+oMkS+1m9CMR5SVIX92RKOC994J4ZlQbNQONT08=;
 b=AvPuoD4QHALwEbG+X1yQAGFCZGrqsjLLyufvZXVWb1zxomOQWcA/2hPFQvd1yNgdD4
 jsQc+qf8czhkwwGhhcF6+gZNk3jd4wum+HxcQaWzq14giETyxdYEXvdfzVRAknreBZYe
 P/g9pAOz28gFYRlejXxokPyDrdugmMe6VHZH4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6r3n+oMkS+1m9CMR5SVIX92RKOC994J4ZlQbNQONT08=;
 b=jVvO0lnM+pTqJlJ8TD4dCEi6LDo4jiTImCz6DvYQF2Occ7f8mZh5Asm/nz13VM2wp1
 Ee+m04RvERaham4c4YeuMI2EX7qmilxLEGID7AaQfkceSrjNI4EAzD/3eSqwiZ4XHcAa
 p4swMwqOL3uyiSpHSP5+pKXTQur+dnwNOBp4su+oglp7dkO/5r7E5qKOf8zFcL58SNqI
 BHLhzueqjaE1CYCSNxQKvrU1CoS662Axd886Vgh8iM9zf1H88fsW85XhqiF8Vrk/WdQN
 5PDFUCAqGfPuOMjmoLdR49PkEB3udPsQJ7UuiRu9roYu8UDLJnzsE6UtwgG7nC0003AX
 Ka2A==
X-Gm-Message-State: AOAM533HxZHvW8Rr7DeaAZ4LfhMnmNRWU3csR7X4wzdc8LaKLN1b/kqN
 HfMUmQ0cHD0UBjy4rRhnt20AnTigFO4P0qox6IJtRQ==
X-Google-Smtp-Source: ABdhPJyBhXeIu2Zw33HRgzYkQh64RNnxu61z7lca2fm9gf2t8m7AWUwsUcMaDJgS5Lw3Qn7oNBIJ3kYnk6gg1uZTI58=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr7980659lfq.597.1632469540978; 
 Fri, 24 Sep 2021 00:45:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210922093303.23720-1-seiya.wang@mediatek.com>
 <20210922093303.23720-2-seiya.wang@mediatek.com>
In-Reply-To: <20210922093303.23720-2-seiya.wang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Sep 2021 15:45:29 +0800
Message-ID: <CAGXv+5GOHVPBEUBEsLnM0NhRP95F1f==uP9CG-qWjztfqTpQ5Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] arm64: dts: Add Mediatek SoC MT8195 and evaluation
 board dts and Makefile
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_004544_000146_40F22AD8 
X-CRM114-Status: GOOD (  20.41  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Sep 22, 2021 at 5:43 PM Seiya Wang <seiya.wang@mediatek.com> wrote:
>
> Add basic chip support for Mediatek MT8195
>
> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |    1 +
>  arch/arm64/boot/dts/mediatek/mt8195-evb.dts |   29 +
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 1024 +++++++++++++++++++++++++++
>  3 files changed, 1054 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
>
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index 4f68ebed2e31..7aa08bb4c078 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -32,4 +32,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> new file mode 100644
> index 000000000000..82bb10e9a531
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> @@ -0,0 +1,29 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Seiya Wang <seiya.wang@mediatek.com>
> + */
> +/dts-v1/;
> +#include "mt8195.dtsi"
> +
> +/ {
> +       model = "MediaTek MT8195 evaluation board";
> +       compatible = "mediatek,mt8195-evb", "mediatek,mt8195";
> +
> +       aliases {
> +               serial0 = &uart0;
> +       };
> +
> +       chosen {
> +               stdout-path = "serial0:921600n8";
> +       };
> +
> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0 0x40000000 0 0x80000000>;
> +       };
> +};
> +
> +&uart0 {
> +       status = "okay";
> +};

Can you enable anything else? I assume there should at least be some
storage, USB, and PMICs? Even if the hardware isn't publicly available,
it will give us some idea about what is usable, and if and how they hook
up to external components.

> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> new file mode 100644
> index 000000000000..b2ff83882e2e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -0,0 +1,1024 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2021 MediaTek Inc.
> + * Author: Seiya Wang <seiya.wang@mediatek.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> +#include <dt-bindings/reset/ti-syscon.h>
> +
> +/ {
> +       compatible = "mediatek,mt8195";
> +       interrupt-parent = <&gic>;
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +
> +       clocks {

IIRC we have moved away from having a dedicated "clocks" node to group
clock device nodes. Just move the following two device nodes up one
level.

> +               clk26m: oscillator0 {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <26000000>;
> +                       clock-output-names = "clk26m";
> +               };
> +
> +               clk32k: oscillator1 {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <32768>;
> +                       clock-output-names = "clk32k";
> +               };
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a55", "arm,armv8";
> +                       reg = <0x000>;
> +                       enable-method = "psci";
> +                       clock-frequency = <1701000000>;
> +                       capacity-dmips-mhz = <578>;
> +                       cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> +                       next-level-cache = <&l2_0>;
> +                       #cooling-cells = <2>;
> +               };
> +
> +               cpu1: cpu@100 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a55", "arm,armv8";
> +                       reg = <0x100>;
> +                       enable-method = "psci";
> +                       clock-frequency = <1701000000>;
> +                       capacity-dmips-mhz = <578>;
> +                       cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> +                       next-level-cache = <&l2_0>;
> +                       #cooling-cells = <2>;
> +               };
> +
> +               cpu2: cpu@200 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a55", "arm,armv8";
> +                       reg = <0x200>;
> +                       enable-method = "psci";
> +                       clock-frequency = <1701000000>;
> +                       capacity-dmips-mhz = <578>;
> +                       cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> +                       next-level-cache = <&l2_0>;
> +                       #cooling-cells = <2>;
> +               };
> +
> +               cpu3: cpu@300 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a55", "arm,armv8";
> +                       reg = <0x300>;
> +                       enable-method = "psci";
> +                       clock-frequency = <1701000000>;
> +                       capacity-dmips-mhz = <578>;
> +                       cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> +                       next-level-cache = <&l2_0>;
> +                       #cooling-cells = <2>;
> +               };
> +
> +               cpu4: cpu@400 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a78", "arm,armv8";
> +                       reg = <0x400>;
> +                       enable-method = "psci";
> +                       clock-frequency = <2171000000>;
> +                       capacity-dmips-mhz = <1024>;
> +                       cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> +                       next-level-cache = <&l2_1>;
> +                       #cooling-cells = <2>;
> +               };
> +
> +               cpu5: cpu@500 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a78", "arm,armv8";
> +                       reg = <0x500>;
> +                       enable-method = "psci";
> +                       clock-frequency = <2171000000>;
> +                       capacity-dmips-mhz = <1024>;
> +                       cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> +                       next-level-cache = <&l2_1>;
> +                       #cooling-cells = <2>;
> +               };
> +
> +               cpu6: cpu@600 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a78", "arm,armv8";
> +                       reg = <0x600>;
> +                       enable-method = "psci";
> +                       clock-frequency = <2171000000>;
> +                       capacity-dmips-mhz = <1024>;
> +                       cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> +                       next-level-cache = <&l2_1>;
> +                       #cooling-cells = <2>;
> +               };
> +
> +               cpu7: cpu@700 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a78", "arm,armv8";
> +                       reg = <0x700>;
> +                       enable-method = "psci";
> +                       clock-frequency = <2171000000>;
> +                       capacity-dmips-mhz = <1024>;
> +                       cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> +                       next-level-cache = <&l2_1>;
> +                       #cooling-cells = <2>;
> +               };
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu1>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu2>;
> +                               };
> +                               core3 {
> +                                       cpu = <&cpu3>;
> +                               };
> +                       };
> +                       cluster1 {
> +                               core0 {
> +                                       cpu = <&cpu4>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu5>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu6>;
> +                               };
> +                               core3 {
> +                                       cpu = <&cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               idle-states {
> +                       entry-method = "arm,psci";
> +                       cpuoff_l: cpuoff_l {
> +                               compatible = "arm,idle-state";
> +                               arm,psci-suspend-param = <0x00010001>;
> +                               local-timer-stop;
> +                               entry-latency-us = <50>;
> +                               exit-latency-us = <95>;
> +                               min-residency-us = <580>;
> +                       };
> +                       cpuoff_b: cpuoff_b {
> +                               compatible = "arm,idle-state";
> +                               arm,psci-suspend-param = <0x00010001>;
> +                               local-timer-stop;
> +                               entry-latency-us = <45>;
> +                               exit-latency-us = <140>;
> +                               min-residency-us = <740>;
> +                       };
> +                       clusteroff_l: clusteroff_l {
> +                               compatible = "arm,idle-state";
> +                               arm,psci-suspend-param = <0x01010002>;
> +                               local-timer-stop;
> +                               entry-latency-us = <55>;
> +                               exit-latency-us = <155>;
> +                               min-residency-us = <840>;
> +                       };
> +                       clusteroff_b: clusteroff_b {
> +                               compatible = "arm,idle-state";
> +                               arm,psci-suspend-param = <0x01010002>;
> +                               local-timer-stop;
> +                               entry-latency-us = <50>;
> +                               exit-latency-us = <200>;
> +                               min-residency-us = <1000>;
> +                       };
> +               };
> +
> +               l2_0: l2-cache0 {
> +                       compatible = "cache";
> +                       next-level-cache = <&l3_0>;
> +               };
> +
> +               l2_1: l2-cache1 {
> +                       compatible = "cache";
> +                       next-level-cache = <&l3_0>;
> +               };
> +
> +               l3_0: l3-cache {
> +                       compatible = "cache";
> +               };
> +       };
> +
> +       dsu-pmu {
> +               compatible = "arm,dsu-pmu";
> +               interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
> +               cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> +                      <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> +       };
> +
> +       pmu-a55 {
> +               compatible = "arm,cortex-a55-pmu";
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
> +       };
> +
> +       pmu-a78 {
> +               compatible = "arm,cortex-a78-pmu";
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-1.0";
> +               method = "smc";
> +       };
> +
> +       timer: timer {
> +               compatible = "arm,armv8-timer";
> +               interrupt-parent = <&gic>;
> +               interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +                            <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
> +               clock-frequency = <13000000>;
> +       };

The interrupts for the PMUs and arch timer aren't listed, as the interrupt
table in the datasheet isn't for the GIC, but another interrupt controller
used in low power modes. It does contain mappings to the GIC for most, but
not all interrupts.

> +
> +       soc {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               compatible = "simple-bus";
> +               ranges;
> +
> +               gic: interrupt-controller@c000000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <4>;
> +                       #redistributor-regions = <1>;
> +                       interrupt-parent = <&gic>;
> +                       interrupt-controller;
> +                       reg = <0 0x0c000000 0 0x40000>,
> +                             <0 0x0c040000 0 0x200000>;
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +                       ppi-partitions {
> +                               ppi_cluster0: interrupt-partition-0 {
> +                                       affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
> +                               };
> +                               ppi_cluster1: interrupt-partition-1 {
> +                                       affinity = <&cpu4 &cpu5 &cpu6 &cpu7>;
> +                               };
> +                       };
> +               };
> +

[...]

> +               pio: pinctrl@10005000 {
> +                       compatible = "mediatek,mt8195-pinctrl";
> +                       reg = <0 0x10005000 0 0x1000>,
> +                             <0 0x11d10000 0 0x1000>,
> +                             <0 0x11d30000 0 0x1000>,
> +                             <0 0x11d40000 0 0x1000>,
> +                             <0 0x11e20000 0 0x1000>,
> +                             <0 0x11eb0000 0 0x1000>,
> +                             <0 0x11f40000 0 0x1000>,
> +                             <0 0x1000b000 0 0x1000>;
> +                       reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> +                                   "iocfg_br", "iocfg_lm", "iocfg_rb",
> +                                   "iocfg_tl", "eint";
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       gpio-ranges = <&pio 0 0 144>;
> +                       interrupt-controller;
> +                       interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;

If I am reading the datasheet correctly, this interrupt line is listed as
reserved. OTOH there are a bunch of EINT interrupts.

> +                       #interrupt-cells = <2>;
> +
> +                       pmif_pin: pmif_default_pin {
> +                               pinmux = <PINMUX_GPIO36__FUNC_RTC32K_CK>,
> +                                        <PINMUX_GPIO40__FUNC_PWRAP_SPI0_CSN>,
> +                                        <PINMUX_GPIO41__FUNC_PWRAP_SPI0_CK>,
> +                                        <PINMUX_GPIO42__FUNC_PWRAP_SPI0_MO>,
> +                                        <PINMUX_GPIO43__FUNC_PWRAP_SPI0_MI>,
> +                                        <PINMUX_GPIO44__FUNC_SPMI_M_SCL>,
> +                                        <PINMUX_GPIO45__FUNC_SPMI_M_SDA>;
> +                       };
> +               };
> +
> +               pwrap: pwrap@10024000 {
> +                       compatible = "mediatek,mt8195-pwrap", "syscon";
> +                       reg = <0 0x10024000 0 0x1000>;

The datasheet I have doesn't provide a memory map, nor is there a section
for this hardware block. As such I can't verify the register region.

> +                       reg-names = "pwrap";
> +                       interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
> +                                <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
> +                       clock-names = "spi", "wrap";
> +                       assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC>;
> +                       assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
> +                       pinctrl-names = "default";
> +                       pinctrl-0 = <&pmif_pin>;
> +               };

[...]

> +               mmc1: mmc@11240000 {
> +                       compatible = "mediatek,mt8195-mmc",
> +                                    "mediatek,mt8192-mmc";
> +                       reg = <0 0x11240000 0 0x1000>,
> +                             <0 0x11c70000 0 0x1000>;
> +                       interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks = <&topckgen CLK_TOP_MSDC30_1>,
> +                                <&infracfg_ao CLK_INFRA_AO_MSDC1>,
> +                                <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
> +                       clock-names = "source", "hclk", "source_cg";
> +                       status = "disabled";
> +               };
> +

mmc2 missing?

> +               imp_iic_wrap_s: syscon@11d03000 {
> +                       compatible = "mediatek,mt8195-imp_iic_wrap_s", "syscon";
> +                       reg = <0 0x11d03000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };

The datasheet I have doesn't provide a memory map, nor is there a section
for this hardware block. As such I can't verify the register region.

> +               imp_iic_wrap_w: syscon@11e05000 {
> +                       compatible = "mediatek,mt8195-imp_iic_wrap_w", "syscon";
> +                       reg = <0 0x11e05000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };

The datasheet I have doesn't provide a memory map, nor is there a section
for this hardware block. As such I can't verify the register region.

[...]

> +               wpesys: syscon@14e00000 {
> +                       compatible = "mediatek,mt8195-wpesys", "syscon";
> +                       reg = <0 0x14e00000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               wpesys_vpp0: syscon@14e02000 {
> +                       compatible = "mediatek,mt8195-wpesys_vpp0", "syscon";
> +                       reg = <0 0x14e02000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               wpesys_vpp1: syscon@14e03000 {
> +                       compatible = "mediatek,mt8195-wpesys_vpp1", "syscon";
> +                       reg = <0 0x14e03000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };

The datasheet I have doesn't provide a memory map, nor is there a section
for the wpe related hardware blocks. As such I can't verify the register
region.

[...]

> +               vdecsys_soc: syscon@1800f000 {
> +                       compatible = "mediatek,mt8195-vdecsys_soc", "syscon";
> +                       reg = <0 0x1800f000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vdecsys: syscon@1802f000 {
> +                       compatible = "mediatek,mt8195-vdecsys", "syscon";
> +                       reg = <0 0x1802f000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vdecsys_core1: syscon@1803f000 {
> +                       compatible = "mediatek,mt8195-vdecsys_core1", "syscon";
> +                       reg = <0 0x1803f000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };

The datasheet I have doesn't provide a memory map, nor is there a section
for the vdec related hardware blocks. As such I can't verify the register
region.

[...]

> +               vencsys: syscon@1a000000 {
> +                       compatible = "mediatek,mt8195-vencsys", "syscon";
> +                       reg = <0 0x1a000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };
> +
> +               vencsys_core1: syscon@1b000000 {
> +                       compatible = "mediatek,mt8195-vencsys_core1", "syscon";
> +                       reg = <0 0x1b000000 0 0x1000>;
> +                       #clock-cells = <1>;
> +               };

The datasheet I have doesn't provide a memory map, nor is there a section
for the venc related hardware blocks. As such I can't verify the register
region.

Besides the aforementioned parts, all the memory ranges, interrupt lines,
and clocks seem to be in order.


ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
