Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226ECC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:08:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B61E720714
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 09:08:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o4a9Ap5L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JAWTxOG0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B61E720714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DXVSrCOuwzEXxnQHBonDpaNBrBZ4rEvkLKfunpweJ7U=; b=o4a9Ap5L44mkL8F5A3cK4lVw5
	7g3/zyJqbvk1rxVLS+HeIvfkc9EaX5Duaq26ih/ICheWpz6/XHLT3WXqapvK/BV9LynVL1k1pjZ4W
	q74sEsmJP+i15pDIi/8TXSYsxzSsBR7LpBue4bKfw16R1nAmPRyCEMv1HD7E/ULvOCUcRK1vQe7RH
	FP1HGd547l5Zws2exBnJiIXTM5n1vKvGUDLyiws0sy2Y1xomDlbmY5yZQX2nlwM/tDxrJB+/Thx1c
	3WZs6+SRO6fXA2e7c8BSuC6d4QxwSoBuQUL4YszKwcnvDBGyp8hmqunoTW8u5fGVQ6by2VVEv55km
	qW0YcFgGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyXDS-0002eZ-VE; Thu, 23 Jul 2020 09:08:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyXDK-0002bH-5y; Thu, 23 Jul 2020 09:08:31 +0000
X-UUID: c27da0e1dd8b4dea984537eb83f7cc79-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ZhQVYTDpx15IXe+66gCp4ZlkiHNdCG9Gg9lEAFNxsc8=; 
 b=JAWTxOG0MByPexKrsZ59QLA2FrI1Njtk26y1n3zQR6YDqfXsR+/w+E3LfUM6vBR4j71N0UviaOM6VqPOPolbhPwxVOkXVI0bDWklp/Bp5KPp/x6QGywxCuo0rQhNrVJ9vJkfXtpQv/Noak4kxo9X9+edJqE++Ocd9YBqR/eXaMY=;
X-UUID: c27da0e1dd8b4dea984537eb83f7cc79-20200723
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <seiya.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 292529897; Thu, 23 Jul 2020 01:08:24 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 02:08:22 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 17:08:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 17:08:22 +0800
From: Seiya Wang <seiya.wang@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 1/4] arm64: dts: Add Mediatek SoC MT8192 and evaluation board
 dts and Makefile
Date: Thu, 23 Jul 2020 17:07:28 +0800
Message-ID: <20200723090731.4482-2-seiya.wang@mediatek.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20200723090731.4482-1-seiya.wang@mediatek.com>
References: <20200723090731.4482-1-seiya.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_050830_460277_1BC01D67 
X-CRM114-Status: GOOD (  17.25  )
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com, Seiya Wang <seiya.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add basic chip support for Mediatek MT8192, include uart, watchdog, spi,
pinctrl, pwrap and clock controller nodes.

Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt8192-evb.dts |  29 ++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 663 ++++++++++++++++++++++++++++
 3 files changed, 693 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a57af9da9f5c..80320ed2d82c 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -11,4 +11,5 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana-rev7.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8183-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt8192-evb.dts b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
new file mode 100644
index 000000000000..0205837fa698
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192-evb.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ * Author: Seiya Wang <seiya.wang@mediatek.com>
+ */
+/dts-v1/;
+#include "mt8192.dtsi"
+
+/ {
+	model = "MediaTek MT8192 evaluation board";
+	compatible = "mediatek,mt8192-evb", "mediatek,mt8192";
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
diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
new file mode 100644
index 000000000000..7d724f24fc9e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -0,0 +1,663 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2020 MediaTek Inc.
+ * Author: Seiya Wang <seiya.wang@mediatek.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/clock/mt8192-clk.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/mt8192-pinfunc.h>
+#include <dt-bindings/power/mt8192-power.h>
+
+/ {
+	compatible = "mediatek,mt8192";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	clk26m: oscillator@0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <26000000>;
+		clock-output-names = "clk26m";
+	};
+
+	clk32k: oscillator@1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		clock-output-names = "clk32k";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x000>;
+			enable-method = "psci";
+			clock-frequency = <1701000000>;
+			next-level-cache = <&l2_0>;
+			capacity-dmips-mhz = <768>;
+		};
+
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			enable-method = "psci";
+			clock-frequency = <1701000000>;
+			next-level-cache = <&l2_0>;
+			capacity-dmips-mhz = <768>;
+		};
+
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			enable-method = "psci";
+			clock-frequency = <1701000000>;
+			next-level-cache = <&l2_0>;
+			capacity-dmips-mhz = <768>;
+		};
+
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			enable-method = "psci";
+			clock-frequency = <1701000000>;
+			next-level-cache = <&l2_0>;
+			capacity-dmips-mhz = <768>;
+		};
+
+		cpu4: cpu@400 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x400>;
+			enable-method = "psci";
+			clock-frequency = <2171000000>;
+			next-level-cache = <&l2_1>;
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu5: cpu@500 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x500>;
+			enable-method = "psci";
+			clock-frequency = <2171000000>;
+			next-level-cache = <&l2_1>;
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu6: cpu@600 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x600>;
+			enable-method = "psci";
+			clock-frequency = <2171000000>;
+			next-level-cache = <&l2_1>;
+			capacity-dmips-mhz = <1024>;
+		};
+
+		cpu7: cpu@700 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a76";
+			reg = <0x700>;
+			enable-method = "psci";
+			clock-frequency = <2171000000>;
+			next-level-cache = <&l2_1>;
+			capacity-dmips-mhz = <1024>;
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
+
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
+	pmu-a55 {
+		compatible = "arm,cortex-a55-pmu";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
+	};
+
+	pmu-a76 {
+		compatible = "arm,cortex-a76-pmu";
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
+		topckgen: topckgen@10000000 {
+			compatible = "mediatek,mt8192-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg: infracfg@10001000 {
+			compatible = "mediatek,mt8192-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pericfg: pericfg@10003000 {
+			compatible = "mediatek,mt8192-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt8192-pinctrl";
+			reg = <0 0x10005000 0 0x1000>,
+			      <0 0x11c20000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>,
+			      <0 0x11d30000 0 0x1000>,
+			      <0 0x11d40000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11e70000 0 0x1000>,
+			      <0 0x11ea0000 0 0x1000>,
+			      <0 0x11f20000 0 0x1000>,
+			      <0 0x11f30000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "iocfg0", "iocfg_rm", "iocfg_bm",
+				    "iocfg_bl", "iocfg_br", "iocfg_lm",
+				    "iocfg_lb", "iocfg_rt", "iocfg_lt",
+				    "iocfg_tl", "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 220>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH 0>;
+			#interrupt-cells = <2>;
+		};
+
+		scpsys: power-controller@10006000 {
+			compatible = "mediatek,mt8192-scpsys", "syscon";
+			reg = <0 0x10006000 0 0x1000>;
+			#power-domain-cells = <1>;
+			clocks = <&topckgen CLK_TOP_MFG_PLL_SEL>,
+				 <&topckgen CLK_TOP_IMG1_SEL>,
+				 <&topckgen CLK_TOP_IMG2_SEL>,
+				 <&topckgen CLK_TOP_IPE_SEL>,
+				 <&topckgen CLK_TOP_VDEC_SEL>,
+				 <&topckgen CLK_TOP_VENC_SEL>,
+				 <&topckgen CLK_TOP_MDP_SEL>,
+				 <&topckgen CLK_TOP_DISP_SEL>,
+				 <&topckgen CLK_TOP_AUD_INTBUS_SEL>,
+				 <&infracfg CLK_INFRA_AUDIO_26M_B>,
+				 <&infracfg CLK_INFRA_AUDIO>,
+				 <&topckgen CLK_TOP_ADSP_SEL>,
+				 <&topckgen CLK_TOP_CAM_SEL>,
+				 <&imgsys CLK_IMG_LARB9>,
+				 <&imgsys CLK_IMG_GALS>,
+				 <&imgsys2 CLK_IMG2_LARB11>,
+				 <&imgsys2 CLK_IMG2_GALS>,
+				 <&ipesys CLK_IPE_LARB19>,
+				 <&ipesys CLK_IPE_LARB20>,
+				 <&ipesys CLK_IPE_SMI_SUBCOM>,
+				 <&ipesys CLK_IPE_GALS>,
+				 <&vdecsys_soc CLK_VDEC_SOC_VDEC>,
+				 <&vdecsys_soc CLK_VDEC_SOC_LAT>,
+				 <&vdecsys_soc CLK_VDEC_SOC_LARB1>,
+				 <&vdecsys CLK_VDEC_VDEC>,
+				 <&vdecsys CLK_VDEC_LAT>,
+				 <&vdecsys CLK_VDEC_LARB1>,
+				 <&vencsys CLK_VENC_SET1_VENC>,
+				 <&mdpsys CLK_MDP_SMI0>,
+				 <&mmsys CLK_MM_SMI_INFRA>,
+				 <&mmsys CLK_MM_SMI_COMMON>,
+				 <&mmsys CLK_MM_SMI_GALS>,
+				 <&mmsys CLK_MM_SMI_IOMMU>,
+				 <&camsys CLK_CAM_LARB13>,
+				 <&camsys CLK_CAM_LARB14>,
+				 <&camsys CLK_CAM_CCU_GALS>,
+				 <&camsys CLK_CAM_CAM2MM_GALS>,
+				 <&camsys_rawa CLK_CAM_RAWA_LARBX>,
+				 <&camsys_rawb CLK_CAM_RAWB_LARBX>,
+				 <&camsys_rawc CLK_CAM_RAWC_LARBX>;
+			clock-names = "mfg", "isp", "isp2", "ipe", "vdec",
+				      "venc", "mdp", "disp", "audio", "audio1",
+				      "audio2", "adsp", "cam", "isp-0",
+				      "isp-1", "isp2-0", "isp2-1", "ipe-0",
+				      "ipe-1", "ipe-2", "ipe-3", "vdec-0",
+				      "vdec-1", "vdec-2", "vdec2-0", "vdec2-1",
+				      "vdec2-2", "venc-0", "mdp-0", "disp-0",
+				      "disp-1", "disp-2", "disp-3", "cam-0",
+				      "cam-1", "cam-2", "cam-3", "cam_rawa-0",
+				      "cam_rawb-0", "cam_rawc-0";
+			infracfg = <&infracfg>;
+		};
+
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8192-wdt";
+			reg = <0 0x10007000 0 0x100>;
+			#reset-cells = <1>;
+		};
+
+		apmixedsys: apmixedsys@1000c000 {
+			compatible = "mediatek,mt8192-apmixedsys", "syscon";
+			reg = <0 0x1000c000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pwrap: pwrap@10026000 {
+			compatible = "mediatek,mt6873-pwrap";
+			reg = <0 0x10026000 0 0x1000>;
+			reg-names = "pwrap";
+			interrupts = <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&infracfg CLK_INFRA_PMIC_AP>,
+				 <&infracfg CLK_INFRA_PMIC_TMR>;
+			clock-names = "spi", "wrap";
+			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
+		};
+
+		spmi_bus: spmi@10027000 {
+			compatible = "mediatek,pmif";
+			reg = <0 0x10027000 0 0x000e00>,
+			      <0 0x10027f00 0 0x00008c>,
+			      <0 0x10029000 0 0x000100>;
+			reg-names = "pmif", "pmifmpu", "spmimst";
+			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-names = "pmif_irq";
+			irq_event_en = <0x0 0x0 0x00300000 0x00000100 0x0>;
+			clocks = <&infracfg CLK_INFRA_PMIC_AP>,
+				 <&infracfg CLK_INFRA_PMIC_TMR>,
+				 <&topckgen CLK_TOP_SPMI_MST_SEL>;
+			clock-names = "pmif_sys_ck",
+				      "pmif_tmr_ck",
+				      "spmimst_clk_mux";
+			assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
+			swinf_ch_start = <4>;
+			ap_swinf_no = <2>;
+		};
+
+		scp_adsp: scp_adsp@10720000 {
+			compatible = "mediatek,mt8192-scp_adsp", "syscon";
+			reg = <0 0x10720000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt8192-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x1000>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt8192-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x1000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		imp_iic_wrap_c: imp_iic_wrap_c@11007000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_c", "syscon";
+			reg = <0 0x11007000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		spi0: spi@1100a000 {
+			compatible = "mediatek,mt8192-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x1100a000 0 0x1000>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI0>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi1: spi@11010000 {
+			compatible = "mediatek,mt8192-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11010000 0 0x1000>;
+			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI1>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi2: spi@11012000 {
+			compatible = "mediatek,mt8192-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11012000 0 0x1000>;
+			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI2>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi3: spi@11013000 {
+			compatible = "mediatek,mt8192-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11013000 0 0x1000>;
+			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI3>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi4: spi@11018000 {
+			compatible = "mediatek,mt8192-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11018000 0 0x1000>;
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI4>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi5: spi@11019000 {
+			compatible = "mediatek,mt8192-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x11019000 0 0x1000>;
+			interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI5>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi6: spi@1101d000 {
+			compatible = "mediatek,mt8192-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x1101d000 0 0x1000>;
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI6>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		spi7: spi@1101e000 {
+			compatible = "mediatek,mt8192-spi",
+				     "mediatek,mt6765-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0 0x1101e000 0 0x1000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH 0>;
+			clocks = <&topckgen CLK_TOP_MAINPLL_D5_D4>,
+				 <&topckgen CLK_TOP_SPI_SEL>,
+				 <&infracfg CLK_INFRA_SPI7>;
+			clock-names = "parent-clk", "sel-clk", "spi-clk";
+			status = "disabled";
+		};
+
+		audsys: audsys@11210000 {
+			compatible = "mediatek,mt8192-audsys", "syscon";
+			reg = <0 0x11210000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imp_iic_wrap_e: imp_iic_wrap_e@11cb1000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_e", "syscon";
+			reg = <0 0x11cb1000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imp_iic_wrap_s: imp_iic_wrap_s@11d03000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_s", "syscon";
+			reg = <0 0x11d03000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imp_iic_wrap_ws: imp_iic_wrap_ws@11d23000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_ws", "syscon";
+			reg = <0 0x11d23000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imp_iic_wrap_w: imp_iic_wrap_w@11e01000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_w", "syscon";
+			reg = <0 0x11e01000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imp_iic_wrap_n: imp_iic_wrap_n@11f02000 {
+			compatible = "mediatek,mt8192-imp_iic_wrap_n", "syscon";
+			reg = <0 0x11f02000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		msdc_top: msdc_top@11f10000 {
+			compatible = "mediatek,mt8192-msdc_top", "syscon";
+			reg = <0 0x11f10000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		msdc: msdc@11f60000 {
+			compatible = "mediatek,mt8192-msdc", "syscon";
+			reg = <0 0x11f60000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mfgcfg: mfgcfg@13fbf000 {
+			compatible = "mediatek,mt8192-mfgcfg", "syscon";
+			reg = <0 0x13fbf000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mmsys: mmsys@14000000 {
+			compatible = "mediatek,mt8192-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys: imgsys@15020000 {
+			compatible = "mediatek,mt8192-imgsys", "syscon";
+			reg = <0 0x15020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys2: imgsys2@15820000 {
+			compatible = "mediatek,mt8192-imgsys2", "syscon";
+			reg = <0 0x15820000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys_soc: vdecsys_soc@1600f000 {
+			compatible = "mediatek,mt8192-vdecsys_soc", "syscon";
+			reg = <0 0x1600f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys: vdecsys@1602f000 {
+			compatible = "mediatek,mt8192-vdecsys", "syscon";
+			reg = <0 0x1602f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: vencsys@17000000 {
+			compatible = "mediatek,mt8192-vencsys", "syscon";
+			reg = <0 0x17000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apu_conn: apu_conn@19020000 {
+			compatible = "mediatek,mt8192-apu_conn", "syscon";
+			reg = <0 0x19020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apu_vcore: apu_vcore@19029000 {
+			compatible = "mediatek,mt8192-apu_vcore", "syscon";
+			reg = <0 0x19029000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apu0: apu0@19030000 {
+			compatible = "mediatek,mt8192-apu0", "syscon";
+			reg = <0 0x19030000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apu1: apu1@19031000 {
+			compatible = "mediatek,mt8192-apu1", "syscon";
+			reg = <0 0x19031000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		apu_mdla0: apu_mdla0@19034000 {
+			compatible = "mediatek,mt8192-apu_mdla0", "syscon";
+			reg = <0 0x19034000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys: camsys@1a000000 {
+			compatible = "mediatek,mt8192-camsys", "syscon";
+			reg = <0 0x1a000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawa: camsys_rawa@1a04f000 {
+			compatible = "mediatek,mt8192-camsys_rawa", "syscon";
+			reg = <0 0x1a04f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawb: camsys_rawb@1a06f000 {
+			compatible = "mediatek,mt8192-camsys_rawb", "syscon";
+			reg = <0 0x1a06f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys_rawc: camsys_rawc@1a08f000 {
+			compatible = "mediatek,mt8192-camsys_rawc", "syscon";
+			reg = <0 0x1a08f000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		ipesys: ipesys@1b000000 {
+			compatible = "mediatek,mt8192-ipesys", "syscon";
+			reg = <0 0x1b000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mdpsys: mdpsys@1f000000 {
+			compatible = "mediatek,mt8192-mdpsys", "syscon";
+			reg = <0 0x1f000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+	};
+};
-- 
2.14.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
