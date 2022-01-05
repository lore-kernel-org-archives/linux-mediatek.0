Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34589C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jan 2022 02:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vv/JSD5bYs5lDJBbFXF29zn9uLexgWA2lq2CiKWMHBY=; b=F50tP2CkdYumXO
	IroEQCEqQR/muwQCLyn6byav7TsUzpW12bfBu4PLDOSZI0hRhRkc5tdusvtqnFYD8040u/d7OTgAK
	SZ2JbCN5ndCUDMd8CluOkdoVZezZzQo0brOLaCX24dyilKmDp3Qxm8QeiEeL41FvDFpM+JGeGz+xT
	msSvvoa947rVHruYpLURciGz5EOec1xCx8kEO63DP6rg4aoXV+arkPepAIpgj5QqmrO8+1CfHuCwi
	+RI9FA0KVNqBxmsdoDZVLjRl98vEc/U6kPjkJ8SyHjmq4G33b80Gm2dOyf+oTlpFMwX9vjCQpjrof
	HlQl2bcpa39WXSFfVnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4w2y-00DK6z-1K; Wed, 05 Jan 2022 02:29:04 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4w1o-00DJUE-O0; Wed, 05 Jan 2022 02:27:54 +0000
X-UUID: ed3902613a7f48d883fa435fae856181-20220104
X-UUID: ed3902613a7f48d883fa435fae856181-20220104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1877224813; Tue, 04 Jan 2022 19:27:49 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 4 Jan 2022 18:27:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 10:27:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 5 Jan 2022 10:27:46 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
CC: <hsinyi@chromium.org>, <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-iio@vger.kernel.org>, <linux-mmc@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v2 7/7] arm64: dts: Add Mediatek SoC MT8186 dts and evaluation
 board and Makefile
Date: Wed, 5 Jan 2022 10:27:26 +0800
Message-ID: <20220105022726.2458-8-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220105022726.2458-1-allen-kh.cheng@mediatek.com>
References: <20220105022726.2458-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_182752_809441_1738508D 
X-CRM114-Status: GOOD (  16.36  )
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

Add basic chip support for Mediatek MT8186

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt8186-evb.dts |  24 ++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi    | 352 ++++++++++++++++++++
 3 files changed, 377 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index 4f68ebed2e31..2271c3452c64 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -31,5 +31,6 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-kodama-sku32.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8186-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8186-evb.dts b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
new file mode 100644
index 000000000000..eb23d1f19f87
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186-evb.dts
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+/dts-v1/;
+#include "mt8186.dtsi"
+
+/ {
+	model = "MediaTek MT8186 evaluation board";
+	compatible = "mediatek,mt8186-evb", "mediatek,mt8186";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
new file mode 100644
index 000000000000..fce84c341291
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2022 MediaTek Inc.
+ */
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
+
+/ {
+	compatible = "mediatek,mt8186";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@000 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0000>;
+			enable-method = "psci";
+			clock-frequency = <2000000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu1: cpu@001 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0100>;
+			enable-method = "psci";
+			clock-frequency = <2000000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu2: cpu@002 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0200>;
+			enable-method = "psci";
+			clock-frequency = <2000000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu3: cpu@003 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0300>;
+			enable-method = "psci";
+			clock-frequency = <2000000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu4: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0400>;
+			enable-method = "psci";
+			clock-frequency = <2000000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu5: cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x0500>;
+			enable-method = "psci";
+			clock-frequency = <2000000000>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l &mcusysoff>;
+			next-level-cache = <&l2_0>;
+		};
+
+		cpu6: cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a75", "arm,armv8";
+			reg = <0x0600>;
+			enable-method = "psci";
+			clock-frequency = <2050000000>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b &mcusysoff>;
+			next-level-cache = <&l2_1>;
+		};
+
+		cpu7: cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a75", "arm,armv8";
+			reg = <0x0700>;
+			enable-method = "psci";
+			clock-frequency = <2050000000>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b &mcusysoff>;
+			next-level-cache = <&l2_1>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+				
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+
+				core5 {
+					cpu = <&cpu5>;
+				};
+
+			};
+			cluster1 {
+				core0 {
+					cpu = <&cpu6>;
+				};
+
+				core1 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		idle-states {
+			entry-method = "psci";
+
+			cpuoff_l: cpu-off-l {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00010001>;
+				local-timer-stop;
+				entry-latency-us = <50>;
+				exit-latency-us = <100>;
+				min-residency-us = <1600>;
+			};
+
+			cpuoff_b: cpu-off-b {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00010001>;
+				local-timer-stop;
+				entry-latency-us = <50>;
+				exit-latency-us = <100>;
+				min-residency-us = <1400>;
+			};
+
+			clusteroff_l: cluster-off-l {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x01010001>;
+				local-timer-stop;
+				entry-latency-us = <100>;
+				exit-latency-us = <250>;
+				min-residency-us = <2100>;
+			};
+
+			clusteroff_b: cluster-off-b {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x01010001>;
+				local-timer-stop;
+				entry-latency-us = <100>;
+				exit-latency-us = <250>;
+				min-residency-us = <1900>;
+			};
+
+			mcusysoff: mcusys-off {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x01010002>;
+				local-timer-stop;
+				entry-latency-us = <300>;
+				exit-latency-us = <1200>;
+				min-residency-us = <2600>;
+			};
+		};
+
+		l2_0: l2-cache0 {
+			compatible = "cache";
+			next-level-cache = <&l3_0>;
+		};
+
+		l2_1: l2-cache1 {
+			compatible = "cache";
+			next-level-cache = <&l3_0>;
+		};
+
+		l3_0: l3-cache {
+			compatible = "cache";
+		};
+	};
+
+	clk26m: oscillator-26m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+	};
+
+	clk32k: oscillator-32k {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32000>;
+	};
+
+	psci {
+		compatible      = "arm,psci-1.0";
+		method          = "smc";
+	};
+
+	gic: interrupt-controller {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		#redistributor-regions = <1>;
+		interrupt-parent = <&gic>;
+		interrupt-controller;
+		reg = <0 0x0c000000 0 0x40000>, // distributor
+		      <0 0x0c040000 0 0x200000>; // redistributor
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	watchdog: watchdog@10007000 {
+		compatible = "mediatek,mt8186-wdt",
+				"mediatek,mt6589-wdt";
+		reg = <0 0x10007000 0 0x1000>;
+	};
+
+	sys_timer@10017000 {
+		compatible = "mediatek,mt8186_timer",
+			     "mediatek,mt6765-timer";
+		reg = <0 0x10017000 0 0x1000>;
+		interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk26m>;
+	};
+
+	timer: timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
+		clock-frequency = <13000000>;
+	};
+
+	uart0: serial@11002000 {
+		compatible = "mediatek,mt8186-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0 0x11002000 0 0x1000>;
+		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk26m>, <&clk26m>;
+		clock-names = "baud", "bus";
+	};
+
+	uart1: serial@11003000 {
+		compatible = "mediatek,mt8186-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0 0x11003000 0 0x1000>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk26m>, <&clk26m>;
+		clock-names = "baud", "bus";
+		status = "disabled";
+	};
+
+	uart2: serial@11018000 {
+		compatible = "mediatek,mt8186-uart",
+			     "mediatek,mt6577-uart";
+		reg = <0 0x11018000 0 0x1000>;
+		interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk26m>, <&clk26m>;
+		clock-names = "baud", "bus";
+		status = "disabled";
+	};
+
+	mmc0: mmc@11230000 {
+		compatible = "mediatek,mt8186-mmc", "mediatek,mt8183-mmc";
+		reg = <0 0x11230000 0 0x1000>,
+		      <0 0x11cd0000 0 0x1000>;
+		interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk26m>,
+			 <&clk26m>,
+			 <&clk26m>,
+			 <&clk26m>;
+		clock-names = "source", "hclk", "source_cg",
+			      "ahb_clk";
+		status = "disabled";
+	};
+
+	mmc1: mmc@11240000 {
+		compatible = "mediatek,mt8186-mmc", "mediatek,mt8183-mmc";
+		reg = <0 0x11240000 0 0x1000>,
+		      <0 0x11c90000 0 0x1000>;
+		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk26m>,
+			 <&clk26m>,
+			 <&clk26m>;
+		clock-names = "source", "hclk", "source_cg";
+		status = "disabled";
+	};
+
+	u3phy1: usb-phy1@11c80000 {
+		compatible = "mediatek,mt8186-tphy", "mediatek,generic-tphy-v2";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "okay";
+
+		u2port1: usb2-phy1@11c80000 {
+			reg = <0 0x11c80000 0 0x700>;
+			clocks = <&clk26m>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+			status = "okay";
+		};
+
+		u3port1: usb3-phy1@11c80900 {
+			reg = <0 0x11c80900 0 0x700>;
+			clocks = <&clk26m>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+			status = "okay";
+		};
+	};
+
+	u3phy0: usb-phy@11ca0000 {
+		compatible = "mediatek,mt8186-tphy", "mediatek,generic-tphy-v2";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		status = "okay";
+
+		u2port0: usb2-phy@11ca0000 {
+			reg = <0 0x11ca0000 0 0x700>;
+			clocks = <&clk26m>;
+			clock-names = "ref";
+			#phy-cells = <1>;
+			mediatek,discth = <0x8>;
+			status = "okay";
+		};
+	};
+};
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
