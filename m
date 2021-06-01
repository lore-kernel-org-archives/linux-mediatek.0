Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE166C47080
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 07:54:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 881BE6124B
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 07:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 881BE6124B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVvozM3kwUrCRHV/tG51Uz6EdRlyKgHmBZqiSpVpVAM=; b=dtlJg6QZVvJhZm
	kyIdnsxUD1UAzcYKy0ZmFapZsW69ARYTvtBa3KFdYX/RPdWS/lLrnQMxEo7JwJA0LvD1YVLBdDQ9t
	KLyetle3pIwHOrED97jLbpI4fGI84Hn5XyBXhwZ3ef4txdw50LrLAjMeIDYZlKSRZ/BT0UCa2eg6r
	WPZfrQyISbIcPFfxKM+wODDajA12eZfDl6jZLFsGG7kXQ8TjVpHB4BVUa/qZZXPb9C4xMxy3J1Uba
	cgN5rizilHBUGiqcNhzOuiDFfPjk3z6VdYgWCVfi415MfKY2hu44NaHzOyI+bUS2REG3mrkp47KCn
	nlRhA1H8XysJEzty5hRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnzEQ-00FCTo-1o; Tue, 01 Jun 2021 07:54:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnzEF-00FCOF-93; Tue, 01 Jun 2021 07:54:25 +0000
X-UUID: d8254865f9f842298df3e8ea3b431417-20210601
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SbuYEa0NlAMz2anUAMSwEmtjMcRRtwbtfrtMygkKJRY=; 
 b=UvYOrrhJwmB7OCY4TWXiKgj51y38fRrzpoZfkRs8/vnS7kQTk4KCpH9Vl0JifN3NPyizKWGem2OWicNu7zRRLbNQYU6Hz5k/DkVvEpbuZWV24X8Qb/7s3+9+heGB9hyne6lODWin6rV6IFzibapxDbw1+VuXQ3C90dN/21Kd0uo=;
X-UUID: d8254865f9f842298df3e8ea3b431417-20210601
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2054427247; Tue, 01 Jun 2021 00:54:20 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 00:54:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 15:54:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 1 Jun 2021 15:54:16 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>, Seiya Wang
 <seiya.wang@mediatek.com>
Subject: [v3 1/1] arm64: dts: Add Mediatek SoC MT8195 and evaluation board dts
 and Makefile
Date: Tue, 1 Jun 2021 15:53:50 +0800
Message-ID: <20210601075350.31515-2-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20210601075350.31515-1-seiya.wang@mediatek.com>
References: <20210601075350.31515-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_005423_378979_669E802E 
X-CRM114-Status: GOOD (  15.76  )
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

Add basic chip support for Mediatek MT8195

Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts |  29 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi    | 561 ++++++++++++++++++++++++++++
 3 files changed, 591 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a1c50adc98fa..6044c8e46302 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -24,4 +24,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku0.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-kukui-krane-sku176.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
new file mode 100644
index 000000000000..82bb10e9a531
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Seiya Wang <seiya.wang@mediatek.com>
+ */
+/dts-v1/;
+#include "mt8195.dtsi"
+
+/ {
+	model = "MediaTek MT8195 evaluation board";
+	compatible = "mediatek,mt8195-evb", "mediatek,mt8195";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x80000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
new file mode 100644
index 000000000000..8fc2af12c0f8
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -0,0 +1,561 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Author: Seiya Wang <seiya.wang@mediatek.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	compatible = "mediatek,mt8195";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clocks {
+		clk26m: oscillator0 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <26000000>;
+			clock-output-names = "clk26m";
+		};
+
+		clk32k: oscillator1 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+			clock-output-names = "clk32k";
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x000>;
+			enable-method = "psci";
+			clock-frequency = <1701000000>;
+			capacity-dmips-mhz = <578>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x100>;
+			enable-method = "psci";
+			clock-frequency = <1701000000>;
+			capacity-dmips-mhz = <578>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x200>;
+			enable-method = "psci";
+			clock-frequency = <1701000000>;
+			capacity-dmips-mhz = <578>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55", "arm,armv8";
+			reg = <0x300>;
+			enable-method = "psci";
+			clock-frequency = <1701000000>;
+			capacity-dmips-mhz = <578>;
+			cpu-idle-states = <&cpuoff_l &clusteroff_l>;
+			next-level-cache = <&l2_0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78", "arm,armv8";
+			reg = <0x400>;
+			enable-method = "psci";
+			clock-frequency = <2171000000>;
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78", "arm,armv8";
+			reg = <0x500>;
+			enable-method = "psci";
+			clock-frequency = <2171000000>;
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78", "arm,armv8";
+			reg = <0x600>;
+			enable-method = "psci";
+			clock-frequency = <2171000000>;
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78", "arm,armv8";
+			reg = <0x700>;
+			enable-method = "psci";
+			clock-frequency = <2171000000>;
+			capacity-dmips-mhz = <1024>;
+			cpu-idle-states = <&cpuoff_b &clusteroff_b>;
+			next-level-cache = <&l2_1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		idle-states {
+			entry-method = "arm,psci";
+			cpuoff_l: cpuoff_l {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00010001>;
+				local-timer-stop;
+				entry-latency-us = <50>;
+				exit-latency-us = <95>;
+				min-residency-us = <580>;
+			};
+			cpuoff_b: cpuoff_b {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x00010001>;
+				local-timer-stop;
+				entry-latency-us = <45>;
+				exit-latency-us = <140>;
+				min-residency-us = <740>;
+			};
+			clusteroff_l: clusteroff_l {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x01010002>;
+				local-timer-stop;
+				entry-latency-us = <55>;
+				exit-latency-us = <155>;
+				min-residency-us = <840>;
+			};
+			clusteroff_b: clusteroff_b {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x01010002>;
+				local-timer-stop;
+				entry-latency-us = <50>;
+				exit-latency-us = <200>;
+				min-residency-us = <1000>;
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
+	dsu-pmu {
+		compatible = "arm,dsu-pmu";
+		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH 0>;
+		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
+		       <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
+	};
+
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-a78 {
+		compatible = "arm,cortex-a78-pmu";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
+	timer: timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
+		clock-frequency = <13000000>;
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		gic: interrupt-controller@c000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <4>;
+			#redistributor-regions = <1>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			reg = <0 0x0c000000 0 0x40000>,
+			      <0 0x0c040000 0 0x200000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
+				};
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu4 &cpu5 &cpu6 &cpu7>;
+				};
+			};
+		};
+
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt8195-pinctrl";
+			reg = <0 0x10005000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>,
+			      <0 0x11d30000 0 0x1000>,
+			      <0 0x11d40000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11eb0000 0 0x1000>,
+			      <0 0x11f40000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
+				    "iocfg_br", "iocfg_lm", "iocfg_rb",
+				    "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 144>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
+			#interrupt-cells = <2>;
+		};
+
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8195-wdt", "mediatek,mt6589-wdt";
+			reg = <0 0x10007000 0 0x100>;
+		};
+
+		systimer: timer@10017000 {
+			compatible = "mediatek,mt8195-timer", "mediatek,mt6765-timer";
+			reg = <0 0x10017000 0 0x1000>;
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>;
+		};
+
+		uart0: serial@11001100 {
+			compatible = "mediatek,mt8195-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001100 0 0x100>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart1: serial@11001200 {
+			compatible = "mediatek,mt8195-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001200 0 0x100>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+		};
+
+		uart2: serial@11001300 {
+			compatible = "mediatek,mt8195-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001300 0 0x100>;
+			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart3: serial@11001400 {
+			compatible = "mediatek,mt8195-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001400 0 0x100>;
+			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart4: serial@11001500 {
+			compatible = "mediatek,mt8195-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001500 0 0x100>;
+			interrupts = <GIC_SPI 724 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart5: serial@11001600 {
+			compatible = "mediatek,mt8195-uart", "mediatek,mt6577-uart";
+			reg = <0 0x11001600 0 0x100>;
+			interrupts = <GIC_SPI 725 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		auxadc: auxadc@11002000 {
+			compatible = "mediatek,mt8195-auxadc", "mediatek,mt8173-auxadc";
+			reg = <0 0x11002000 0 0x1000>;
+			clocks = <&clk26m>;
+			clock-names = "main";
+			#io-channel-cells = <1>;
+			status = "disabled";
+		};
+
+		spi0: spi@1100a000 {
+			compatible = "mediatek,mt8195-spi", "mediatek,mt6765-spi";
+			reg = <0 0x1100a000 0 0x100>;
+			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi1: spi@11010000 {
+			compatible = "mediatek,mt8195-spi", "mediatek,mt6765-spi";
+			reg = <0 0x11010000 0 0x100>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi2: spi@11012000 {
+			compatible = "mediatek,mt8195-spi", "mediatek,mt6765-spi";
+			reg = <0 0x11012000 0 0x100>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi3: spi@11013000 {
+			compatible = "mediatek,mt8195-spi", "mediatek,mt6765-spi";
+			reg = <0 0x11013000 0 0x100>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi4: spi@11018000 {
+			compatible = "mediatek,mt8195-spi", "mediatek,mt6765-spi";
+			reg = <0 0x11018000 0 0x100>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi5: spi@11019000 {
+			compatible = "mediatek,mt8195-spi", "mediatek,mt6765-spi";
+			reg = <0 0x11019000 0 0x100>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spis0: spi@1101d000 {
+			compatible = "mediatek,mt8195-spi-slave";
+			reg = <0 0x1101d000 0 0x100>;
+			interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>;
+			clock-names = "spi";
+			assigned-clocks = <&clk26m>;
+			assigned-clock-parents = <&clk26m>;
+			status = "disabled";
+		};
+
+		spis1: spi@1101e000 {
+			compatible = "mediatek,mt8195-spi-slave";
+			reg = <0 0x1101e000 0 0x100>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>;
+			clock-names = "spi";
+			assigned-clocks = <&clk26m>;
+			assigned-clock-parents = <&clk26m>;
+			status = "disabled";
+		};
+
+		mmc0: mmc@11230000 {
+			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
+			reg = <0 0x11230000 0 0x10000>,
+			      <0 0x11f50000 0 0x1000>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		mmc1: mmc@11240000 {
+			compatible = "mediatek,mt8195-mmc", "mediatek,mt8192-mmc";
+			reg = <0 0x11240000 0 0x1000>,
+			      <0 0x11c70000 0 0x1000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>, <&clk26m>;
+			clock-names = "source", "hclk", "source_cg";
+			status = "disabled";
+		};
+
+		nor_flash: nor@1132c000 {
+			compatible = "mediatek,mt8195-nor", "mediatek,mt8173-nor";
+			reg = <0 0x1132c000 0 0x1000>;
+			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "spi", "sf";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		u3phy2: t-phy@11c40000 {
+			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11c40000 0x700>;
+			status = "disabled";
+
+			u2port2: usb-phy@0 {
+				reg = <0x0 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+		};
+
+		u3phy3: t-phy@11c50000 {
+			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11c50000 0x700>;
+			status = "disabled";
+
+			u2port3: usb-phy@0 {
+				reg = <0x0 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+		};
+
+		u3phy1: t-phy@11e30000 {
+			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11e30000 0xe00>;
+			status = "disabled";
+
+			u2port1: usb-phy@0 {
+				reg = <0x0 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+
+			u3port1: usb-phy@700 {
+				reg = <0x700 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+		};
+
+		u3phy0: t-phy@11e40000 {
+			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v2";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0 0x11e40000 0xe00>;
+			status = "disabled";
+
+			u2port0: usb-phy@0 {
+				reg = <0x0 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+
+			u3port0: usb-phy@700 {
+				reg = <0x700 0x700>;
+				clocks = <&clk26m>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+		};
+
+		ufsphy: phy@11fa0000 {
+			compatible = "mediatek,mt8195-ufsphy", "mediatek,mt8183-ufsphy";
+			reg = <0 0x11fa0000 0 0xc000>;
+			clocks = <&clk26m>, <&clk26m>;
+			clock-names = "unipro", "mp";
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
