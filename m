Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89618C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 01:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40BC260F23
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 01:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 40BC260F23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QuNK/4KPOtNx/Fgudqeide4bMFNOkVkleGAgU339QTI=; b=oAkB/jDKyS+6ND
	j4LPmPiK75Idbd9YKzIez+HXgHoVOQn8FTBAAgRTr1GGOgoodxr1mZ0eOf3tKmK33SUsqC42lyKlR
	ZulGOxJMZFaB2P/pF98Q9LzJIJXIB/JX+ku1HEp4TdYYaK4ZH6O+Q5jiSz0CKj6K2yOYFAm7joaHd
	IYxkVXXqjOAr1B65CZqEUoQkDLiUYqclvOMmDBT9gE5MOo3sycBs7LNeOBjoqEwSw9Ygi3JATbFLE
	U4DNRrLW6rkUCMBa617Nm72FaugwgNpdLX8IZStdSpT9Vc1JS78C/hhWgiqpgorRJbCaEne9koHIq
	E4E7v/RKHDbUwIJzHQLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbCEP-004xWD-03; Fri, 15 Oct 2021 01:41:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbCEB-004xUB-GI; Fri, 15 Oct 2021 01:41:45 +0000
X-UUID: 556cb463644740b6b5a9389e9792ddb2-20211014
X-UUID: 556cb463644740b6b5a9389e9792ddb2-20211014
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 99697527; Thu, 14 Oct 2021 18:41:39 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Oct 2021 18:41:37 -0700
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Oct 2021 09:41:37 +0800
Message-ID: <f1dbe08d6729bbf400e2a683c058333ccde9a8f3.camel@mediatek.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: mediatek: add basic mt7986b support
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, "Enric Balletbo i
 Serra" <enric.balletbo@collabora.com>, Fabien Parent <fparent@baylibre.com>,
 Seiya Wang <seiya.wang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
Date: Fri, 15 Oct 2021 09:41:37 +0800
In-Reply-To: <632e8d11-269c-d329-abf4-5d462aac4df4@gmail.com>
References: <20211014074403.17346-1-sam.shih@mediatek.com>
 <20211014074403.17346-4-sam.shih@mediatek.com>
 <632e8d11-269c-d329-abf4-5d462aac4df4@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_184143_583635_CD493E41 
X-CRM114-Status: GOOD (  28.00  )
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

Hi 

On Thu, 2021-10-14 at 17:32 +0200, Matthias Brugger wrote:
> 
> On 14/10/2021 09:44, Sam Shih wrote:
> > Add basic chip support for Mediatek mt7986b, include
> > basic uart nodes, rng node and watchdog node.
> > 
> > Add cpu node, timer node, gic node, psci and reserved-memory node
> > for ARM Trusted Firmware.
> > 
> > Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> > 
> > ---
> > v6: separate basic part into a single patch series
> > v5: follow reviewr's comment: removed clock freqency node in timer
> > due to
> >      we have set CNTFRQ_EL0 in ATF firmware, and also corrected
> > GICD range
> > v4: added missing gic register bases, and fixed range of GICR
> > v3: used the stdout-path instead of console=ttyS0
> > v2: modified clock and uart node due to clock driver updated
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile        |   1 +
> >   arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  26 ++++
> >   arch/arm64/boot/dts/mediatek/mt7986b.dtsi    | 149
> > +++++++++++++++++++
> >   3 files changed, 176 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> > b/arch/arm64/boot/dts/mediatek/Makefile
> > index e6c3a73b9e4a..d555e43d1ccc 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> > b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> > new file mode 100644
> > index 000000000000..95a202505bb2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + * Author: Sam.Shih <sam.shih@mediatek.com>
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt7986b.dtsi"
> > +
> > +/ {
> > +	model = "MediaTek MT7986b RFB";
> > +	compatible = "mediatek,mt7986b-rfb";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:115200n8";
> > +		bootargs = "earlycon=uart8250,mmio32,0x11002000
> > swiotlb=512";
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> 
> We are missing a memory node here. I wonder how the board was able to
> boot 
> without memory. Did you test this series?
> 

Yes, I have tested this patch series in my local environment,

Our u-boot seems to pass the memory configuration to the kernel
according to its memory detection mechanism, so it was able to boot.

But for the kernel upstream, do you think it is better to
add the memory node back to the kernel dts?

If yes, I will send the next patch to add the mermory node back to the
kernel dts.


> Regards,
> Matthias
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
> > new file mode 100644
> > index 000000000000..2b8e0a382398
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
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
> > +	compatible = "mediatek,mt7986b";
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

Thanks,
Sam


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
