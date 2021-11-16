Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B8EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 01:40:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A0361A0D
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 01:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7A0361A0D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vqqMFOq+dI6q81dXruVD7BFlFyBd6JddVU9MM+Woigk=; b=WNNJLsAIECYH/Q
	jFVDAA/D8+Vi8s5GGzpRMAVrBcovwDgLZLK3TktkN+lPX3c0esy7uK8VoW9qRjLcfCRK5iYx+0gH9
	Zv1kyJJCkTbuqkspY+fuEUXkk0FGJrFqHtflCSZXeeSoBgJPsehX2c76kVu0FyEpYLXQw/qTclNZR
	qR7yd9eTTTHDYmjEM0ECG95Ha6r2/l0utb5HLul9ilXRHtY09m2tyf1ynEyrIZNuhjEI6zMBTdSOC
	qBKxrl283q5FYIttCsLcvk2C7AkdCxIkCrCdoOkuCMG5xGi+aaHpLcDV0xHsH5qiae8aWMrb8yJVj
	wH+DD9NVETXax7pR1B9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmnSG-00HZt4-Jh; Tue, 16 Nov 2021 01:40:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmnS2-00HZpp-2y; Tue, 16 Nov 2021 01:40:02 +0000
X-UUID: ce98be07c4994a3b935444f5ba1a2397-20211115
X-UUID: ce98be07c4994a3b935444f5ba1a2397-20211115
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1158665244; Mon, 15 Nov 2021 18:39:52 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Nov 2021 17:39:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 16 Nov 2021 09:39:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Nov 2021 09:39:49 +0800
Message-ID: <d299493d8fec0f34f527942f2cdedf15f2136c9a.camel@mediatek.com>
Subject: Re: [PATCH v7 2/3] arm64: dts: mediatek: add basic mt7986a support
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, "Enric Balletbo i
 Serra" <enric.balletbo@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Seiya Wang <seiya.wang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
Date: Tue, 16 Nov 2021 09:39:49 +0800
In-Reply-To: <d411aec5-efa8-c71d-8179-54ff52c17039@gmail.com>
References: <20211018114009.13350-1-sam.shih@mediatek.com>
 <20211018114009.13350-3-sam.shih@mediatek.com>
 <d411aec5-efa8-c71d-8179-54ff52c17039@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_173958_180833_735A6528 
X-CRM114-Status: GOOD (  36.94  )
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

On Mon, 2021-11-15 at 17:27 +0100, Matthias Brugger wrote:
> Hi,
> 
> On 18/10/2021 13:40, Sam Shih wrote:
> > Add basic chip support for Mediatek mt7986a, include
> > basic uart nodes, rng node and watchdog node.
> > 
> > Add cpu node, timer node, gic node, psci and reserved-memory node
> > for ARM Trusted Firmware.
> > 
> 
> What is the exact difference between mt7986a and mt7986b? Right now,
> it's only 
> the compatible, for that it makes no sense to split them.
> 

The difference between mt7986a and mt7986b is pinout which described
in our pinctrl patch series 
https://lore.kernel.org/all/20211022124036.5291-3-sam.shih@mediatek.com/

You are right, in this "basic SoC support" patch series, only show
compatible differences

> It would be good to see what the exact differences are, so that we
> can see if it 
> makes sense to have one of the alternatives:
> 1) use a common mt7986.dtsi which get included by mt7986[a,b].dtsi
> 2) Use on mt7986.dtsi and only add one mt7986a.dtsi or mt7986b.dtsi
> which has 
> add-ons.
> 

In this case, can we use solution (1) to create a generic mt7986.dtsi
in this patch series, and add mt7986[a,b].dtsi to the dts part of the
pinctrl patch series to separate the difference nodes?

> > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> > 
> > ---
> > v7: added memory node back to dts
> > v6: removed clock and pinctrl node, to separate basic part into a
> > single
> >      patch series
> > 
> > Original thread:
> > 
https://urldefense.com/v3/__https://lore.kernel.org/all/20211004124155.1404-1-sam.shih@mediatek.com/__;!!CTRNKA9wMg0ARbw!xCEW0lwTKx4k272sWASoi90y_yRyQdAx0oNJC-jSAIWnIEkprJD-gAc1ugCvo0ex$
> >  
> > 
> > v5: follow reviewr's comment: removed clock freqency node in timer
> > due to
> >      we have set CNTFRQ_EL0 in ATF firmware, and also corrected
> > GICD range
> > v4: added missing gic register bases, and fixed range of GICR
> > v3: used the stdout-path instead of console=ttyS0
> > v2: modified clock and uart node due to clock driver updated
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile        |   1 +
> >   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  38 +++++
> >   arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 149
> > +++++++++++++++++++
> >   3 files changed, 188 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> > b/arch/arm64/boot/dts/mediatek/Makefile
> > index 4f68ebed2e31..e6c3a73b9e4a 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -7,6 +7,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> > b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> > new file mode 100644
> > index 000000000000..ca074cf8e578
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
> > @@ -0,0 +1,38 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + * Author: Sam.Shih <sam.shih@mediatek.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt7986a.dtsi"
> > +
> > +/ {
> > +	model = "MediaTek MT7986a RFB";
> > +	compatible = "mediatek,mt7986a-rfb";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +		bootargs = "earlycon=uart8250,mmio32,0x11002000
> > swiotlb=512";
> 
> We normally don't add earlycon parameter to the normal bootargs, as
> it's only 
> for debugging. Also what do we need the swiotlb? Are there any
> limitation in the 
> HW that makes us need it?
> 

Thank you for your suggestion, as far as I know, it should not have
hardware limitations. This bootargs is just inherent from mt7622-
rfb.dts, I will delete it and test again on our development board.

> Regards,
> Matthias
> 
> > +	};
> > +
> > +	memory {
> > +		reg = <0 0x40000000 0 0x40000000>;
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > +
> > +&uart1 {
> > +	status = "okay";
> > +};
> > +
> > +&uart2 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > new file mode 100644
> > index 000000000000..75912bcf6c9c
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> > @@ -0,0 +1,149 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + * Author: Sam.Shih <sam.shih@mediatek.com>
> > + */
> > +
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	compatible = "mediatek,mt7986a";
> > +	interrupt-parent = <&gic>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	system_clk: dummy40m {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <40000000>;
> > +		#clock-cells = <0>;
> > +	};
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		cpu0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x0>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu1: cpu@1 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x1>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu2: cpu@2 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a53";
> > +			enable-method = "psci";
> > +			reg = <0x2>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu3: cpu@3 {
> > +			device_type = "cpu";
> > +			enable-method = "psci";
> > +			compatible = "arm,cortex-a53";
> > +			reg = <0x3>;
> > +			#cooling-cells = <2>;
> > +		};
> > +	};
> > +
> > +	psci {
> > +		compatible  = "arm,psci-0.2";
> > +		method      = "smc";
> > +	};
> > +
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> > +		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
> > +		secmon_reserved: secmon@43000000 {
> > +			reg = <0 0x43000000 0 0x30000>;
> > +			no-map;
> > +		};
> > +	};
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> > +	};
> > +
> > +	soc {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		compatible = "simple-bus";
> > +		ranges;
> > +
> > +		gic: interrupt-controller@c000000 {
> > +			compatible = "arm,gic-v3";
> > +			#interrupt-cells = <3>;
> > +			interrupt-parent = <&gic>;
> > +			interrupt-controller;
> > +			reg = <0 0x0c000000 0 0x10000>,  /* GICD */
> > +			      <0 0x0c080000 0 0x80000>,  /* GICR */
> > +			      <0 0x0c400000 0 0x2000>,   /* GICC */
> > +			      <0 0x0c410000 0 0x1000>,   /* GICH */
> > +			      <0 0x0c420000 0 0x2000>;   /* GICV */
> > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +		};
> > +
> > +		watchdog: watchdog@1001c000 {
> > +			compatible = "mediatek,mt7986-wdt",
> > +				     "mediatek,mt6589-wdt";
> > +			reg = <0 0x1001c000 0 0x1000>;
> > +			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
> > +			#reset-cells = <1>;
> > +			status = "disabled";
> > +		};
> > +
> > +		trng: trng@1020f000 {
> > +			compatible = "mediatek,mt7986-rng",
> > +				     "mediatek,mt7623-rng";
> > +			reg = <0 0x1020f000 0 0x100>;
> > +			clocks = <&system_clk>;
> > +			clock-names = "rng";
> > +			status = "disabled";
> > +		};
> > +
> > +		uart0: serial@11002000 {
> > +			compatible = "mediatek,mt7986-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11002000 0 0x400>;
> > +			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&system_clk>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart1: serial@11003000 {
> > +			compatible = "mediatek,mt7986-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11003000 0 0x400>;
> > +			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&system_clk>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart2: serial@11004000 {
> > +			compatible = "mediatek,mt7986-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11004000 0 0x400>;
> > +			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&system_clk>;
> > +			status = "disabled";
> > +		};
> > +
> > +	};
> > +
> > +};
> > 

Regards,
Sam


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
