Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A938C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 02:45:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B8126127A
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 02:45:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B8126127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6WNs6wFgjFDaZbDv87rBVgUpIGFpeVxRnjvmnJUy1U=; b=0Df/9oSw1LZ3ZD
	eS2ftdTTMgah/8zMsOX70m4uJFo02+1iAv1zVTX4KAU0PyIO5LVhlDm5FHyd8VeK50nF4nc3x4ly6
	IUxLjndXQEzGipS6freO6GQVEjQH/3DIBUu0d1g7fYBUIX6crS8JUFFsEvznF3I7QXvP890sjqpxz
	BwMSI/OmC5XB36v74ivaFxrZr0AGjkIwPAZqvUXBqO2lrzQES4yzZ8hr2yAtZHxPBXeZ/1pAyQ+bB
	pDp0JpSo9wxT/k+/VnX9n8QSloK2CkBa0Wusj+Z2hyTiLcFEODJyfEkJ9InkoZFPQYs+lEMND9FFY
	OU/89TQLsG1Efkp21WhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqRjW-0066EP-UK; Tue, 08 Jun 2021 02:44:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqRhr-0065kc-0p; Tue, 08 Jun 2021 02:43:11 +0000
X-UUID: 607592d191974b90be4a888ce0d93a0c-20210607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2T/oriG2av+maAOl00giNzRcBudCS75uMflIvhvS+JY=; 
 b=Atiegzl7D4xLZSwJI29qJWcdLxeB4nR88Vn04DcQ04zlaTx1BTQLV9aolWRbTHePCW3B3FjtjEOlhV01SrlI7eirJ57tEw3G3Ih4YeWxBwXvI/JTiWJKLmBtfMZfa/awoJxIbj0hRVJG3e7zVtWM/LYc5UNc/7nZvsUgYm9VjSc=;
X-UUID: 607592d191974b90be4a888ce0d93a0c-20210607
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2126082028; Mon, 07 Jun 2021 19:43:03 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 19:43:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 10:43:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 10:43:00 +0800
Message-ID: <4f628d02a0766aab1b2a37e8198152dc47821a61.camel@mediatek.com>
Subject: Re: [v3 1/1] arm64: dts: Add Mediatek SoC MT8195 and evaluation
 board dts and Makefile
From: Seiya Wang <seiya.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>
Date: Tue, 8 Jun 2021 10:43:00 +0800
In-Reply-To: <feefafa0-62b9-9e0f-d982-71b67a319064@gmail.com>
References: <20210601075350.31515-1-seiya.wang@mediatek.com>
 <20210601075350.31515-2-seiya.wang@mediatek.com>
 <feefafa0-62b9-9e0f-d982-71b67a319064@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_194307_408519_09CA9E60 
X-CRM114-Status: GOOD (  18.31  )
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

On Wed, 2021-06-02 at 13:28 +0200, Matthias Brugger wrote:
> 
> On 01/06/2021 09:53, Seiya Wang wrote:
> > Add basic chip support for Mediatek MT8195
> > 
> > Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  29 ++
> >  arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 561
> > ++++++++++++++++++++++++++++
> >  3 files changed, 591 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/Makefile
> > b/arch/arm64/boot/dts/mediatek/Makefile
> > index a1c50adc98fa..6044c8e46302 100644
> > --- a/arch/arm64/boot/dts/mediatek/Makefile
> > +++ b/arch/arm64/boot/dts/mediatek/Makefile
> > @@ -24,4 +24,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-
> > krane-sku0.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> > +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
> >  dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > new file mode 100644
> > index 000000000000..82bb10e9a531
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
> > @@ -0,0 +1,29 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + * Author: Seiya Wang <seiya.wang@mediatek.com>
> > + */
> > +/dts-v1/;
> > +#include "mt8195.dtsi"
> > +
> > +/ {
> > +	model = "MediaTek MT8195 evaluation board";
> > +	compatible = "mediatek,mt8195-evb", "mediatek,mt8195";
> > +
> > +	aliases {
> > +		serial0 = &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path = "serial0:921600n8";
> > +	};
> > +
> > +	memory@40000000 {
> > +		device_type = "memory";
> > +		reg = <0 0x40000000 0 0x80000000>;
> > +	};
> > +};
> > +
> > +&uart0 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > new file mode 100644
> > index 000000000000..8fc2af12c0f8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> > @@ -0,0 +1,561 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + * Author: Seiya Wang <seiya.wang@mediatek.com>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +	compatible = "mediatek,mt8195";
> > +	interrupt-parent = <&gic>;
> > +	#address-cells = <2>;
> > +	#size-cells = <2>;
> > +
> > +	clocks {
> > +		clk26m: oscillator0 {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <26000000>;
> > +			clock-output-names = "clk26m";
> > +		};
> > +
> > +		clk32k: oscillator1 {
> > +			compatible = "fixed-clock";
> > +			#clock-cells = <0>;
> > +			clock-frequency = <32768>;
> > +			clock-output-names = "clk32k";
> > +		};
> > +	};
> > +
> > +	cpus {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		cpu0: cpu@0 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x000>;
> > +			enable-method = "psci";
> > +			clock-frequency = <1701000000>;
> > +			capacity-dmips-mhz = <578>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu1: cpu@100 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x100>;
> > +			enable-method = "psci";
> > +			clock-frequency = <1701000000>;
> > +			capacity-dmips-mhz = <578>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu2: cpu@200 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x200>;
> > +			enable-method = "psci";
> > +			clock-frequency = <1701000000>;
> > +			capacity-dmips-mhz = <578>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu3: cpu@300 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a55", "arm,armv8";
> > +			reg = <0x300>;
> > +			enable-method = "psci";
> > +			clock-frequency = <1701000000>;
> > +			capacity-dmips-mhz = <578>;
> > +			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
> > +			next-level-cache = <&l2_0>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu4: cpu@400 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a78", "arm,armv8";
> > +			reg = <0x400>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2171000000>;
> > +			capacity-dmips-mhz = <1024>;
> > +			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> > +			next-level-cache = <&l2_1>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu5: cpu@500 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a78", "arm,armv8";
> > +			reg = <0x500>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2171000000>;
> > +			capacity-dmips-mhz = <1024>;
> > +			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> > +			next-level-cache = <&l2_1>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu6: cpu@600 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a78", "arm,armv8";
> > +			reg = <0x600>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2171000000>;
> > +			capacity-dmips-mhz = <1024>;
> > +			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> > +			next-level-cache = <&l2_1>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu7: cpu@700 {
> > +			device_type = "cpu";
> > +			compatible = "arm,cortex-a78", "arm,armv8";
> > +			reg = <0x700>;
> > +			enable-method = "psci";
> > +			clock-frequency = <2171000000>;
> > +			capacity-dmips-mhz = <1024>;
> > +			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
> > +			next-level-cache = <&l2_1>;
> > +			#cooling-cells = <2>;
> > +		};
> > +
> > +		cpu-map {
> > +			cluster0 {
> > +				core0 {
> > +					cpu = <&cpu0>;
> > +				};
> > +				core1 {
> > +					cpu = <&cpu1>;
> > +				};
> > +				core2 {
> > +					cpu = <&cpu2>;
> > +				};
> > +				core3 {
> > +					cpu = <&cpu3>;
> > +				};
> > +			};
> > +			cluster1 {
> > +				core0 {
> > +					cpu = <&cpu4>;
> > +				};
> > +				core1 {
> > +					cpu = <&cpu5>;
> > +				};
> > +				core2 {
> > +					cpu = <&cpu6>;
> > +				};
> > +				core3 {
> > +					cpu = <&cpu7>;
> > +				};
> > +			};
> > +		};
> > +
> > +		idle-states {
> > +			entry-method = "arm,psci";
> > +			cpuoff_l: cpuoff_l {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x00010001>;
> > +				local-timer-stop;
> > +				entry-latency-us = <50>;
> > +				exit-latency-us = <95>;
> > +				min-residency-us = <580>;
> > +			};
> > +			cpuoff_b: cpuoff_b {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x00010001>;
> > +				local-timer-stop;
> > +				entry-latency-us = <45>;
> > +				exit-latency-us = <140>;
> > +				min-residency-us = <740>;
> > +			};
> > +			clusteroff_l: clusteroff_l {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x01010002>;
> > +				local-timer-stop;
> > +				entry-latency-us = <55>;
> > +				exit-latency-us = <155>;
> > +				min-residency-us = <840>;
> > +			};
> > +			clusteroff_b: clusteroff_b {
> > +				compatible = "arm,idle-state";
> > +				arm,psci-suspend-param = <0x01010002>;
> > +				local-timer-stop;
> > +				entry-latency-us = <50>;
> > +				exit-latency-us = <200>;
> > +				min-residency-us = <1000>;
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
> > +	dsu-pmu {
> > +		compatible = "arm,dsu-pmu";
> > +		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
> > +		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
> > +		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
> > +	};
> > +
> > +	pmu-a55 {
> > +		compatible = "arm,cortex-a55-pmu";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH
> > &ppi_cluster0>;
> > +	};
> > +
> > +	pmu-a78 {
> > +		compatible = "arm,cortex-a78-pmu";
> > +		interrupt-parent = <&gic>;
> > +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH
> > &ppi_cluster1>;
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
> > +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> > +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> > +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> > +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
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
> > +			#interrupt-cells = <4>;
> > +			#redistributor-regions = <1>;
> > +			interrupt-parent = <&gic>;
> > +			interrupt-controller;
> > +			reg = <0 0x0c000000 0 0x40000>,
> > +			      <0 0x0c040000 0 0x200000>;
> > +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> > +
> > +			ppi-partitions {
> > +				ppi_cluster0: interrupt-partition-0 {
> > +					affinity = <&cpu0 &cpu1 &cpu2
> > &cpu3>;
> > +				};
> > +				ppi_cluster1: interrupt-partition-1 {
> > +					affinity = <&cpu4 &cpu5 &cpu6
> > &cpu7>;
> > +				};
> > +			};
> > +		};
> > +
> > +		pio: pinctrl@10005000 {
> > +			compatible = "mediatek,mt8195-pinctrl";
> > +			reg = <0 0x10005000 0 0x1000>,
> > +			      <0 0x11d10000 0 0x1000>,
> > +			      <0 0x11d30000 0 0x1000>,
> > +			      <0 0x11d40000 0 0x1000>,
> > +			      <0 0x11e20000 0 0x1000>,
> > +			      <0 0x11eb0000 0 0x1000>,
> > +			      <0 0x11f40000 0 0x1000>,
> > +			      <0 0x1000b000 0 0x1000>;
> > +			reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> > +				    "iocfg_br", "iocfg_lm", "iocfg_rb",
> > +				    "iocfg_tl", "eint";
> > +			gpio-controller;
> > +			#gpio-cells = <2>;
> > +			gpio-ranges = <&pio 0 0 144>;
> > +			interrupt-controller;
> > +			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			#interrupt-cells = <2>;
> > +		};
> > +
> > +		watchdog: watchdog@10007000 {
> > +			compatible = "mediatek,mt8195-wdt",
> > "mediatek,mt6589-wdt";
> 
> "mediatek,mt8195-wdt" not defined in binding description. Please add
> patch for that.
> 
> > +			reg = <0 0x10007000 0 0x100>;
> > +		};
> > +
> > +		systimer: timer@10017000 {
> > +			compatible = "mediatek,mt8195-timer",
> > "mediatek,mt6765-timer";
> > +			reg = <0 0x10017000 0 0x1000>;
> > +			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&clk26m>;
> > +		};
> > +
> > +		uart0: serial@11001100 {
> > +			compatible = "mediatek,mt8195-uart",
> > "mediatek,mt6577-uart";
> > +			reg = <0 0x11001100 0 0x100>;
> > +			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH
> > 0>;
> > +			clocks = <&clk26m>, <&clk26m>;
> > +			clock-names = "baud", "bus";
> 
> I'm not really a fan of having dummy clocks defined in the DTS. When
> can we
> expect the clock controller driver to be posted/mainlined?
> 
> Regards,
> Matthias

I will resend this once the clock controller driver is ready.
Thank you.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
