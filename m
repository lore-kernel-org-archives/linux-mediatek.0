Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9482C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 10:09:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A8061350
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 10:09:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82A8061350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQgvAFOgpofc01Vv1JG93VT0BlfvdkusQOnv+7QR89g=; b=oU9RQbo8s+qPVGXHT56P2FA6Rm
	AMaW3wkwIhAHp0kdsfsK8UrJFXiCF/JUEWls20I7kLSX+bjcqfcAS+LmEIfKTTluiRBYiqbUQF+SN
	zuxnnZQWMbvNroWfWOr4eubUO0pqYMXLi8byJ6U77b2zbWBB3l+v+Ss3Boo/blNaMfoGucmK87sEF
	v9YFzpuA25M8/bV1Muww9bYRcvb31jISd7sZQL6UswU0rALx0Qe6r5xbV6FWBM3jtV4KENcNJca3b
	8PopYDULUEyb5VMGDftI03pmeser32CPp87SumEme5qNS3wwZWgpwMONoKfzhtByYhdNwQZtFSDSW
	4bsie+AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXKug-005vgf-Lf; Mon, 04 Oct 2021 10:09:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXKuM-005vYO-KW; Mon, 04 Oct 2021 10:09:22 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4F52E61350;
 Mon,  4 Oct 2021 10:09:18 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mXKuK-00EaXF-96; Mon, 04 Oct 2021 11:09:16 +0100
MIME-Version: 1.0
Date: Mon, 04 Oct 2021 11:09:16 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: matthias.bgg@gmail.com, Ryder.Lee@mediatek.com,
 devicetree@vger.kernel.org, enric.balletbo@collabora.com,
 fparent@baylibre.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, hsinyi@chromium.org, john@phrozen.org,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net, mpm@selenic.com,
 mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org,
 sean.wang@kernel.org, seiya.wang@mediatek.com, wim@linux-watchdog.org
Subject: Re: [v4,9/9] arm64: dts: mediatek: add mt7986b support
In-Reply-To: <20211004091617.31436-1-sam.shih@mediatek.com>
References: <20210924112701.18459-1-sam.shih@mediatek.com>
 <20211004091617.31436-1-sam.shih@mediatek.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <39193058d8c206e616d7b179762a7829@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sam.shih@mediatek.com, matthias.bgg@gmail.com,
 Ryder.Lee@mediatek.com, devicetree@vger.kernel.org,
 enric.balletbo@collabora.com, fparent@baylibre.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, hsinyi@chromium.org, john@phrozen.org,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net, mpm@selenic.com,
 mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org,
 sean.wang@kernel.org, seiya.wang@mediatek.com, wim@linux-watchdog.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_030918_765791_7BB6D53A 
X-CRM114-Status: GOOD (  18.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-10-04 10:16, Sam Shih wrote:
> Add basic chip support for Mediatek mt7986b, include
> uart nodes with correct clocks, rng node with correct clock,
> and watchdog node and mt7986b pinctrl node.
> 
> Add cpu node, timer node, gic node, psci and reserved-memory node
> for ARM Trusted Firmware,
> 
> Add clock controller nodes, include 40M clock source, topckgen, 
> infracfg,
> apmixedsys and ethernet subsystem.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
> v4: added missing gic register bases, and fixed range of GICR
> v3: used the stdout-path instead of console=ttyS0
> v2: modified clock and uart node due to clock driver updated
> ---
>  arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>  arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  26 +++
>  arch/arm64/boot/dts/mediatek/mt7986b.dtsi    | 230 +++++++++++++++++++
>  3 files changed, 257 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> b/arch/arm64/boot/dts/mediatek/Makefile
> index e6c3a73b9e4a..d555e43d1ccc 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
>  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> new file mode 100644
> index 000000000000..95a202505bb2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +/dts-v1/;
> +#include "mt7986b.dtsi"
> +
> +/ {
> +	model = "MediaTek MT7986b RFB";
> +	compatible = "mediatek,mt7986b-rfb";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon=uart8250,mmio32,0x11002000 swiotlb=512";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> new file mode 100644
> index 000000000000..06c3381a5170
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> @@ -0,0 +1,230 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Sam.Shih <sam.shih@mediatek.com>
> + */
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/mt7986-clk.h>
> +
> +/ {
> +	compatible = "mediatek,mt7986b";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	clk40m: oscillator@0 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <40000000>;
> +		clock-output-names = "clkxtal";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x1>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu2: cpu@2 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			enable-method = "psci";
> +			reg = <0x2>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu3: cpu@3 {
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x3>;
> +			#cooling-cells = <2>;
> +		};
> +	};
> +
> +	psci {
> +		compatible  = "arm,psci-0.2";
> +		method      = "smc";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
> +		secmon_reserved: secmon@43000000 {
> +			reg = <0 0x43000000 0 0x30000>;
> +			no-map;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		clock-frequency = <13000000>;

As previously mentioned, please fix your firmware and drop this.

> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		gic: interrupt-controller@c000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0x0c000000 0 0x40000>,  /* GICD */

This is not a valid value for GICD.

Thanks,

         M.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
