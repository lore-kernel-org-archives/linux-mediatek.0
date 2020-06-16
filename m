Return-Path: <SRS0=8HgB=75=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E61FC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 13:35:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A0C02098B
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2020 13:35:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DlWJM9GV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gKCFbTxL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A0C02098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vU6elrmFEtX8ASOaBFvXWV87BgHaa3QLIVSf56FJAF4=; b=DlWJM9GVZ08PeZ
	Tehvzk1P2plQTR0nAfSOB/2J5vvDHrUpX+n/QFPyT04Mf3VFxTsT+b7oAxhTaftbTh0HZRSIXs6xr
	DcrCebiFAfhvvHBPj2kZAF8Lme4vhJPoKwlubkDD2auwqdyGF3d5UW87ROjjgHVg0cwv6aaOU8yyV
	dfaVk/G72DTKW8wrVN18w0VDmfzM7wN6yhStFiS3IspR1ca5h/sVapr8zdxPRXCqNDUUNoNssiIR1
	IU4hIEpxS/xKkPIUDjUtN7Qbm8smPHruIjSsqlKY5ebJvSo1W+cdpi6mYQ24OoAi0wlHBSw9Q7FKK
	kLaKPattiGHn5xmMAAyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlBjv-00060j-Pm; Tue, 16 Jun 2020 13:34:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlBjc-0005e7-Lb
 for linux-mediatek@lists.infradead.org; Tue, 16 Jun 2020 13:34:42 +0000
X-UUID: e488ff205d0744f384157217267a0bfd-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oLbLrR0m/1qxRAz5VyE7CHtP9X+jYQJwihIxHEwerpY=; 
 b=gKCFbTxLHeDewPXDc3DfC+/tCScAvqkCtOnKau2m3L/28reTPLdBkLwghmkOxT2l00rIyzGZhIrNPE79lK3oJk5iXLDMifvx2AbH/EhePr26MmB4xAalAq/wNu42msdHetTfvivIL2zrRCznYe7mzE7IdR3RxnzHDBiqgpz7IAg=;
X-UUID: e488ff205d0744f384157217267a0bfd-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 353656131; Tue, 16 Jun 2020 05:34:29 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 06:34:33 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 21:34:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Jun 2020 21:34:18 +0800
Message-ID: <1592314461.6256.18.camel@mtkswgap22>
Subject: Re: [PATCH v5 6/6] arm64: dts: add dts nodes for MT6779
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 16 Jun 2020 21:34:21 +0800
In-Reply-To: <3751b55b-07a7-7985-a8d9-5414a4ca0d24@gmail.com>
References: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
 <1585128694-13881-7-git-send-email-hanks.chen@mediatek.com>
 <3751b55b-07a7-7985-a8d9-5414a4ca0d24@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_063440_733078_9EA84BA1 
X-CRM114-Status: GOOD (  18.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-03-25 at 17:39 +0100, Matthias Brugger wrote:
> 
> On 25/03/2020 10:31, Hanks Chen wrote:
> > this adds initial MT6779 dts settings fo board support,
> 
> "for board support"
> 
> > including cpu, gic, timer, ccf, pinctrl, uart...etc.
> 
> The etc is PMU and PSCI and sysirq, correct? Let's list at least sysirq as this
> is something MediaTek specific.
> 
> > 
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile       |    1 +
> >  arch/arm64/boot/dts/mediatek/mt6779-evb.dts |   31 ++++
> >  arch/arm64/boot/dts/mediatek/mt6779.dtsi    |  265 +++++++++++++++++++++++++++
> >  3 files changed, 297 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> > index 458bbc4..53f1c61 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -1,6 +1,7 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6779-evb.dts b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> > new file mode 100644
> > index 0000000..164f5cb
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
> > @@ -0,0 +1,31 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + * Author: Mars.C <mars.cheng@mediatek.com>
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt6779.dtsi"
> > +
> > +/ {
> > +	model = "MediaTek MT6779 EVB";
> > +	compatible = "mediatek,mt6779-evb", "mediatek,mt6779";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0 0x40000000 0 0x1e800000>;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:921600n8";
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> > new file mode 100644
> > index 0000000..422ff5f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
> > @@ -0,0 +1,265 @@
> [...]
> > +
> > +	uart_clk: dummy26m {
> > +		compatible = "fixed-clock";
> > +		clock-frequency = <26000000>;
> > +		#clock-cells = <0>;
> > +	};
> 
> No real clocks for uart? What about CLK_INFRA_UARTx?

sorry, I miss the clocks for uart
I'll add "baud" and "bus" in next version.

clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
clock-names = "baud", "bus";


> 
> > +
> > +	timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
> > +	};
> > +
> > +	soc {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		compatible = "simple-bus";
> > +		ranges;
> > +
> [...]
> > +
> > +		uart0: serial@11002000 {
> > +			compatible = "mediatek,mt6779-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11002000 0 0x400>;
> > +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +			clocks = <&uart_clk>;
> > +			status = "disabled";
> > +		};
> > +
> > +		uart1: serial@11003000 {
> > +			compatible = "mediatek,mt6779-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11003000 0 0x400>;
> > +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
> > +			clocks = <&uart_clk>;
> > +			status = "disabled";
> > +		};
> 
> SoC has only two UARTs but clock driver has three, how comes?
> 

In mt6779 SoC, we have four UARTs.
but we only use UART0 and UART1 as standard serial ports for APMCU.The
others for modem side.
so we add two UARTs in dts.

> > +
> > +		audio: clock-controller@11210000 {
> > +			compatible = "mediatek,mt6779-audio", "syscon";
> > +			reg = <0 0x11210000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		mfgcfg: clock-controller@13fbf000 {
> > +			compatible = "mediatek,mt6779-mfgcfg", "syscon";
> > +			reg = <0 0x13fbf000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> > +		mmsys: clock-controller@14000000 {
> > +			compatible = "mediatek,mt6779-mmsys", "syscon";
> > +			reg = <0 0x14000000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> 
> Please beware that we are refactoring the mmsys right now. Please use this new
> approach as this will go upstream soon.
> 
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=254897
> 
Got it, I'll update new approach in next version.
Thanks!

> Regards,
> Matthias
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
