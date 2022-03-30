Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE5DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 07:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCV/F5cAAhQM7UZobp6Mn2LlIXLOCSbS1kjjrDDrziM=; b=Lb3bUZ3/ws13MB
	wQk+P+ua0MfiuX+IgPyUOJke0bpiI7F1jWMw72lhmq4jxsbiyY0OdnCkiQg7DO7c3t5HM5ol1lE9w
	E0rtGhxNqjIgSTCWj16VwK4sm5lqRnOPUXu2y2W0Q4e2qjUd5DdaMXOtFEC4Rs+qPX/rZZ+VlfL6o
	dHw2VJ/wftBy0M5LnBXc4AbRtDh7whSh8eucpLq9FsgAKzy55Ud7h80o2M8YJoN8zPYCATJHUDcAQ
	ANZv4g0Fm9dC3ldjleDyB5ieWqY7cM2G9rAIWtueETi3Ts6FwZrsduHf1vx31nt5ia0Qeg/k4iQ+9
	kAl93eG0cOPmFqa3ZB4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZSqe-00Ec2B-Od; Wed, 30 Mar 2022 07:34:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZSqN-00Ebw1-0x; Wed, 30 Mar 2022 07:34:17 +0000
X-UUID: dafa4bdc090440bbba3d530282af50dd-20220330
X-UUID: dafa4bdc090440bbba3d530282af50dd-20220330
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1798736995; Wed, 30 Mar 2022 00:34:11 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 00:34:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 30 Mar 2022 15:34:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 15:34:00 +0800
Message-ID: <8c27fbbdf109b53cff5472e89da83741bee4b202.camel@mediatek.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: Add Mediatek SoC MT8186 dts and
 evaluation board and Makefile
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
CC: <hsinyi@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-watchdog@vger.kernel.org>
Date: Wed, 30 Mar 2022 15:34:00 +0800
In-Reply-To: <e06b7f3e-fbc7-63ab-c7b9-0c879cb10807@gmail.com>
References: <20220311130732.22706-1-allen-kh.cheng@mediatek.com>
 <20220311130732.22706-5-allen-kh.cheng@mediatek.com>
 <e06b7f3e-fbc7-63ab-c7b9-0c879cb10807@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_003415_121455_F4258B71 
X-CRM114-Status: GOOD (  27.31  )
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

Hi Matthias,

On Tue, 2022-03-29 at 16:56 +0200, Matthias Brugger wrote:
> 
> On 11/03/2022 14:07, Allen-KH Cheng wrote:
> > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > 
> > Add basic chip support for Mediatek MT8186.
> > 
> 
> Thanks for your patch. I would love to wait a bit longer to see if we
> can get 
> the clock driver accepted. This way we could get rid of all the dummy
> clocks 
> defined in here.
> 
> Please send a new version once the clock driver is accepeted by
> Stephen, or ping 
> this series in a few month.
> 
> Thanks,
> Matthias
> 

Sure, that's great.

I will send a new version after the clock driver is accepted.

Thanks,
Allen

> > Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >   arch/arm64/boot/dts/mediatek/mt8186-evb.dts |  24 ++
> >   arch/arm64/boot/dts/mediatek/mt8186.dtsi    | 356
> > ++++++++++++++++++++
> >   3 files changed, 381 insertions(+)
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> >   create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> > b/arch/arm64/boot/dts/mediatek/Makefile
> > index 8c1e18032f9f..d32fdcf9afc6 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -37,5 +37,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-
> > kodama-sku32.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> >   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > new file mode 100644
> > index 000000000000..eb23d1f19f87
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
> > @@ -0,0 +1,24 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2022 MediaTek Inc.
> > + */
> > +/dts-v1/;
> > +#include "mt8186.dtsi"
> > +
> > +/ {
> > +	model = "MediaTek MT8186 evaluation board";
> > +	compatible = "mediatek,mt8186-evb", "mediatek,mt8186";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:921600n8";
> > +	};
> > +
> > +	memory {
> > +		device_type = "memory";
> > +		reg = <0 0x40000000 0 0x80000000>;
> > +	};
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > new file mode 100644
> > index 000000000000..aa45c75b18c7
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> > @@ -0,0 +1,356 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2022 MediaTek Inc.
> > + * Author: Allen-KH Cheng <allenn-kh.cheng@mediatek.com>
> > + */
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/phy/phy.h>
> > +
> > +/ {
> > +	compatible = "mediatek,mt8186";
> > +	interrupt-parent = <&gic>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	clk13m: oscillator0 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <13000000>;
> > +		clock-output-names = "clk13m";
> > +	};
> > +
> > +	clk26m: oscillator1 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <26000000>;
> > +		clock-output-names = "clk26m";
> > +	};
> > +
> > +	clk32k: oscillator2 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <32000>;
> > +		clock-output-names = "clk32k";
> > +	};
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu0: cpu@000 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x0000>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2000000000>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +		};
> > +
> > +		cpu1: cpu@100 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x0100>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2000000000>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +		};
> > +
> > +		cpu2: cpu@200 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x0200>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2000000000>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +		};
> > +
> > +		cpu3: cpu@300 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x0300>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2000000000>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +		};
> > +
> > +		cpu4: cpu@400 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x0400>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2000000000>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +		};
> > +
> > +		cpu5: cpu@500 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x0500>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2000000000>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +		};
> > +
> > +		cpu6: cpu@600 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a75", "arm,armv8";
> > +			reg = <0x0600>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2050000000>;
> > +			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> > +			next-level-cache = <&l2_1>;
> > +		};
> > +
> > +		cpu7: cpu@700 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a75", "arm,armv8";
> > +			reg = <0x0700>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2050000000>;
> > +			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> > +			next-level-cache = <&l2_1>;
> > +		};
> > +
> > +		cpu-map {
> > +			cluster0 {
> > +				core0 {
> > +					cpu = <&cpu0>;
> > +				};
> > +
> > +				core1 {
> > +					cpu = <&cpu1>;
> > +				};
> > +
> > +				core2 {
> > +					cpu = <&cpu2>;
> > +				};
> > +
> > +				core3 {
> > +					cpu = <&cpu3>;
> > +				};
> > +
> > +				core4 {
> > +					cpu = <&cpu4>;
> > +				};
> > +
> > +				core5 {
> > +					cpu = <&cpu5>;
> > +				};
> > +			};
> > +
> > +			cluster1 {
> > +				core0 {
> > +					cpu = <&cpu6>;
> > +				};
> > +
> > +				core1 {
> > +					cpu = <&cpu7>;
> > +				};
> > +			};
> > +		};
> > +
> > +		idle-states {
> > +			entry-method = "arm,psci";
> > +
> > +			cpuoff_l: cpu-off-l {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x00010001>;
> > +				local-timer-stop;
> > +				entry-latency-us = <50>;
> > +				exit-latency-us = <100>;
> > +				min-residency-us = <1600>;
> > +			};
> > +
> > +			cpuoff_b: cpu-off-b {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x00010001>;
> > +				local-timer-stop;
> > +				entry-latency-us = <50>;
> > +				exit-latency-us = <100>;
> > +				min-residency-us = <1400>;
> > +			};
> > +
> > +			clusteroff_l: cluster-off-l {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x01010001>;
> > +				local-timer-stop;
> > +				entry-latency-us = <100>;
> > +				exit-latency-us = <250>;
> > +				min-residency-us = <2100>;
> > +			};
> > +
> > +			clusteroff_b: cluster-off-b {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x01010001>;
> > +				local-timer-stop;
> > +				entry-latency-us = <100>;
> > +				exit-latency-us = <250>;
> > +				min-residency-us = <1900>;
> > +			};
> > +		};
> > +
> > +		l2_0: l2-cache0 {
> > +			compatible = "cache";
> > +			next-level-cache = <&l3_0>;
> > +		};
> > +
> > +		l2_1: l2-cache1 {
> > +			compatible = "cache";
> > +			next-level-cache = <&l3_0>;
> > +		};
> > +
> > +		l3_0: l3-cache {
> > +			compatible = "cache";
> > +		};
> > +	};
> > +
> > +	psci {
> > +		compatible = "arm,psci-1.0";
> > +		method = "smc";
> > +	};
> > +
> > +	timer: timer {
> > +		compatible = "arm,armv8-timer";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> > +		clock-frequency = <13000000>;
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
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			#redistributor-regions = <1>;
> > +			interrupt-parent = <&gic>;
> > +			interrupt-controller;
> > +			reg = <0 0x0c000000 0 0x40000>, // distributor
> > +			      <0 0x0c040000 0 0x200000>; //
> > redistributor
> > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> > +		};
> > +
> > +		watchdog: watchdog@10007000 {
> > +			compatible = "mediatek,mt8186-wdt",
> > +				     "mediatek,mt6589-wdt";
> > +			mediatek,disable-extrst;
> > +			reg = <0 0x10007000 0 0x1000>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> > +		systimer: timer@10017000 {
> > +			compatible = "mediatek,mt8186-timer",
> > +				     "mediatek,mt6765-timer";
> > +			reg = <0 0x10017000 0 0x1000>;
> > +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&clk13m>;
> > +		};
> > +
> > +		uart0: serial@11002000 {
> > +			compatible = "mediatek,mt8186-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11002000 0 0x1000>;
> > +			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&clk26m>, <&clk26m>;
> > +			clock-names = "baud", "bus";
> > +		};
> > +
> > +		uart1: serial@11003000 {
> > +			compatible = "mediatek,mt8186-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11003000 0 0x1000>;
> > +			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&clk26m>, <&clk26m>;
> > +			clock-names = "baud", "bus";
> > +			status = "disabled";
> > +		};
> > +
> > +		uart2: serial@11018000 {
> > +			compatible = "mediatek,mt8186-uart",
> > +				     "mediatek,mt6577-uart";
> > +			reg = <0 0x11018000 0 0x1000>;
> > +			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&clk26m>, <&clk26m>;
> > +			clock-names = "baud", "bus";
> > +			status = "disabled";
> > +		};
> > +
> > +		mmc0: mmc@11230000 {
> > +			compatible = "mediatek,mt8186-mmc",
> > +				     "mediatek,mt8183-mmc";
> > +			reg = <0 0x11230000 0 0x1000>,
> > +			      <0 0x11cd0000 0 0x1000>;
> > +			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&clk26m>, <&clk26m>, <&clk26m>,
> > +				 <&clk26m>;
> > +			clock-names = "source", "hclk", "source_cg",
> > "ahb_clk";
> > +			status = "disabled";
> > +		};
> > +
> > +		mmc1: mmc@11240000 {
> > +			compatible = "mediatek,mt8186-mmc",
> > +				     "mediatek,mt8183-mmc";
> > +			reg = <0 0x11240000 0 0x1000>,
> > +			      <0 0x11c90000 0 0x1000>;
> > +			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
> > +			clock-names = "source", "hclk", "source_cg";
> > +			status = "disabled";
> > +		};
> > +
> > +		u3phy0: t-phy@11c80000 {
> > +			compatible = "mediatek,mt8186-tphy",
> > +				     "mediatek,generic-tphy-v2";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges = <0x0 0x0 0x11c80000 0x1000>;
> > +
> > +			u2port1: usb2-phy1@0 {
> > +				reg = <0x0 0x700>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +			};
> > +
> > +			u3port1: usb3-phy1@700 {
> > +				reg = <0x700 0x900>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +			};
> > +		};
> > +
> > +		u3phy1: t-phy@11ca0000 {
> > +			compatible = "mediatek,mt8186-tphy",
> > +				     "mediatek,generic-tphy-v2";
> > +			#address-cells = <1>;
> > +			#size-cells = <1>;
> > +			ranges = <0x0 0x0 0x11ca0000 0x1000>;
> > +
> > +			u2port0: usb-phy@0 {
> > +				reg = <0x0 0x700>;
> > +				clocks = <&clk26m>;
> > +				clock-names = "ref";
> > +				#phy-cells = <1>;
> > +				mediatek,discth = <0x8>;
> > +			};
> > +		};
> > +	};
> > +};


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
