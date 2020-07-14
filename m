Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC69C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:07:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ABF22076D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 09:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QPxOkeK3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D/+VsAtL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ABF22076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JWxaq0e4KW3WSpC/MTtHdDKawnqvWjz/KmYwwS7Otqo=; b=QPxOkeK3ci/tfU+rz/QUubK06
	aQf0z2rb9h8c27wMI8AavtV2AqdAF7U83/Z43mJvykoHH7ym/bpLIjR8aChdvwOE64CD18FbF7yUk
	jPsQ77SGYwEspbAwZBQHj8Z3WLCXLV+LGF/afHxnII/bRKJAgXcWex5U+hG5Q7Usr74JsyHrhgAhf
	EH4JYO3bWYjW9ApbGEgm/IK+c+NsRpOrclayPQazfakB17vkjhxmsbqyiuO4/raMVcACD0FGqC+yS
	x81EAWlSz9hUx+64FXQ1XGjtPEp0aQeO5fXcCUpaaf7S9eQTxXdpf/Pa7pNzpyHx3ZJyQcMDtfGlN
	TstQqZ//w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvGuT-0003HP-0J; Tue, 14 Jul 2020 09:07:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvGtl-0002y8-SR; Tue, 14 Jul 2020 09:06:54 +0000
X-UUID: b605e7d3984e464c8fad3d54f3c0f01b-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WBU+POEkNkeOLFMh9wvUxnTGNBJsF3mVvEYTc4CT7Ko=; 
 b=D/+VsAtLM128WqSuDwLEooVantMcuYrjaKKHVEOrZssSWlLi79MMNqqgeoWpKU91P19yn82LClgb/bSRN0StintzGOsjNsf2yZ1uN0x7xTN9Ahgn8PCZdGahnwZvhtYBaYVQHFLxjgPvMm6C71JCxvM7m8vv3/I9CgYsRAnAv0k=;
X-UUID: b605e7d3984e464c8fad3d54f3c0f01b-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 175188943; Tue, 14 Jul 2020 01:06:46 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 02:04:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:04:41 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 14 Jul 2020 17:04:42 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH 6/7] arm64: dts: add dts nodes for MT6779
Date: Tue, 14 Jul 2020 17:04:38 +0800
Message-ID: <1594717479-8160-7-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1594717479-8160-1-git-send-email-hanks.chen@mediatek.com>
References: <1594717479-8160-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 17CF399E76C6BEA6DB803C72CD16C833230A8A0338440A73AA7CF4ECDB85EC592000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_050650_230281_E17C6287 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

this adds initial MT6779 dts settings for board support,
including cpu, gic, timer, ccf, pinctrl, uart, sysirq...etc.

Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/Makefile       |    1 +
 arch/arm64/boot/dts/mediatek/mt6779-evb.dts |   31 +++
 arch/arm64/boot/dts/mediatek/mt6779.dtsi    |  271 +++++++++++++++++++++++++++
 3 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6779.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index a57af9d..4d1b0f9 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6779-evb.dts b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
new file mode 100644
index 0000000..164f5cb
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6779-evb.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Mars.C <mars.cheng@mediatek.com>
+ *
+ */
+
+/dts-v1/;
+#include "mt6779.dtsi"
+
+/ {
+	model = "MediaTek MT6779 EVB";
+	compatible = "mediatek,mt6779-evb", "mediatek,mt6779";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0 0x40000000 0 0x1e800000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
new file mode 100644
index 0000000..370f309
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Author: Mars.C <mars.cheng@mediatek.com>
+ *
+ */
+
+#include <dt-bindings/clock/mt6779-clk.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pinctrl/mt6779-pinfunc.h>
+
+/ {
+	compatible = "mediatek,mt6779";
+	interrupt-parent = <&sysirq>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x000>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x100>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x200>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x300>;
+		};
+
+		cpu4: cpu@4 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x400>;
+		};
+
+		cpu5: cpu@5 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a55";
+			enable-method = "psci";
+			reg = <0x500>;
+		};
+
+		cpu6: cpu@6 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a75";
+			enable-method = "psci";
+			reg = <0x600>;
+		};
+
+		cpu7: cpu@7 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a75";
+			enable-method = "psci";
+			reg = <0x700>;
+		};
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW 0>;
+	};
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
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>;
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		gic: interrupt-controller@0c000000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <4>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
+			      <0 0x0c040000 0 0x200000>; /* GICR */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			ppi-partitions {
+				ppi_cluster0: interrupt-partition-0 {
+					affinity = <&cpu0 &cpu1 \
+						&cpu2 &cpu3 &cpu4 &cpu5>;
+				};
+				ppi_cluster1: interrupt-partition-1 {
+					affinity = <&cpu6 &cpu7>;
+				};
+			};
+
+		};
+
+		sysirq: intpol-controller@0c53a650 {
+			compatible = "mediatek,mt6779-sysirq",
+				     "mediatek,mt6577-sysirq";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			reg = <0 0x0c53a650 0 0x50>;
+		};
+
+		topckgen: clock-controller@10000000 {
+			compatible = "mediatek,mt6779-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg_ao: clock-controller@10001000 {
+			compatible = "mediatek,mt6779-infracfg_ao", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pio: pinctrl@10005000 {
+			compatible = "mediatek,mt6779-pinctrl", "syscon";
+			reg = <0 0x10005000 0 0x1000>,
+			      <0 0x11c20000 0 0x1000>,
+			      <0 0x11d10000 0 0x1000>,
+			      <0 0x11e20000 0 0x1000>,
+			      <0 0x11e70000 0 0x1000>,
+			      <0 0x11ea0000 0 0x1000>,
+			      <0 0x11f20000 0 0x1000>,
+			      <0 0x11f30000 0 0x1000>,
+			      <0 0x1000b000 0 0x1000>;
+			reg-names = "gpio", "iocfg_rm",
+				    "iocfg_br", "iocfg_lm",
+				    "iocfg_lb", "iocfg_rt",
+				    "iocfg_lt", "iocfg_tl",
+				    "eint";
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pio 0 0 210>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		apmixed: clock-controller@1000c000 {
+			compatible = "mediatek,mt6779-apmixed", "syscon";
+			reg = <0 0x1000c000 0 0xe00>;
+			#clock-cells = <1>;
+		};
+
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt6779-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x400>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART0>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt6779-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x400>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART1>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart2: serial@11004000 {
+			compatible = "mediatek,mt6779-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11004000 0 0x400>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_UART2>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		audio: clock-controller@11210000 {
+			compatible = "mediatek,mt6779-audio", "syscon";
+			reg = <0 0x11210000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mfgcfg: clock-controller@13fbf000 {
+			compatible = "mediatek,mt6779-mfgcfg", "syscon";
+			reg = <0 0x13fbf000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt6779-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		imgsys: clock-controller@15020000 {
+			compatible = "mediatek,mt6779-imgsys", "syscon";
+			reg = <0 0x15020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vdecsys: clock-controller@16000000 {
+			compatible = "mediatek,mt6779-vdecsys", "syscon";
+			reg = <0 0x16000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		vencsys: clock-controller@17000000 {
+			compatible = "mediatek,mt6779-vencsys", "syscon";
+			reg = <0 0x17000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		camsys: clock-controller@1a000000 {
+			compatible = "mediatek,mt6779-camsys", "syscon";
+			reg = <0 0x1a000000 0 0x10000>;
+			#clock-cells = <1>;
+		};
+
+		ipesys: clock-controller@1b000000 {
+			compatible = "mediatek,mt6779-ipesys", "syscon";
+			reg = <0 0x1b000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+	};
+};
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
