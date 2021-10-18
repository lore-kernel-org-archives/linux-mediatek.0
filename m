Return-Path: <SRS0=fNpG=PG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0293EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:42:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A4E60FD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Oct 2021 11:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4A4E60FD8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gt1SZgMg2tY/zpY3TKV1EgA9b43xI74OthPaCHmlneg=; b=1RA7RVq1PJtBlx
	u0X+XY5bsC3Jp+AG3t/NYCLAbulC9FVYag+iy5wxrJNV4AAae03oZq3uicNKV3YWLLmd1kgjGy82k
	RVpBCB2+Zwvc3SfYo/+xq1PwyDpLR55YWbqd4euAyQMio5f8Mi7aXthdqMwGciWNRbP3+D8cLTAFZ
	G2hrLHxaPlgdU1TRLouMUt2in1bXon/zCJYG+mabcIyUr7jupOaQI50YrUIoMzOaO2kwqiQsOO22p
	VHrtKbF5mvtrQrvmfTbyIY3IvZqWmuiV+wvv8U8itvnilxNqH7iPWxx6up2UrJDrbRPunc9HQdhPp
	S0yQjhTVxKibESMao1WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcR1h-00FOPf-9u; Mon, 18 Oct 2021 11:41:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcR0M-00FNls-9j; Mon, 18 Oct 2021 11:40:36 +0000
X-UUID: a0faa0fcc53b4048b4d91215583af749-20211018
X-UUID: a0faa0fcc53b4048b4d91215583af749-20211018
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2020813040; Mon, 18 Oct 2021 04:40:30 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 Oct 2021 04:40:28 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 Oct 2021 19:40:28 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Enric Balletbo
 i Serra <enric.balletbo@collabora.com>, Fabien Parent <fparent@baylibre.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, Sam
 Shih <sam.shih@mediatek.com>
Subject: [PATCH v7 3/3] arm64: dts: mediatek: add basic mt7986b support
Date: Mon, 18 Oct 2021 19:40:09 +0800
Message-ID: <20211018114009.13350-4-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211018114009.13350-1-sam.shih@mediatek.com>
References: <20211018114009.13350-1-sam.shih@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_044034_442043_87052FDA 
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

Add basic chip support for Mediatek mt7986b, include
basic uart nodes, rng node and watchdog node.

Add cpu node, timer node, gic node, psci and reserved-memory node
for ARM Trusted Firmware.

Signed-off-by: Sam Shih <sam.shih@mediatek.com>

---
v7: added memory node back to dts
v6: separate basic part into a single patch series
v5: follow reviewr's comment: removed clock freqency node in timer due to
    we have set CNTFRQ_EL0 in ATF firmware, and also corrected GICD range
v4: added missing gic register bases, and fixed range of GICR
v3: used the stdout-path instead of console=ttyS0
v2: modified clock and uart node due to clock driver updated
---
 arch/arm64/boot/dts/mediatek/Makefile        |   1 +
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts |  30 ++++
 arch/arm64/boot/dts/mediatek/mt7986b.dtsi    | 149 +++++++++++++++++++
 3 files changed, 180 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986b.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index e6c3a73b9e4a..d555e43d1ccc 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -8,6 +8,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-x20-dev.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-rfb1.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7622-bananapi-bpi-r64.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986a-rfb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt7986b-rfb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8167-pumpkin.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-elm-hana.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
new file mode 100644
index 000000000000..0f2f337bef4e
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Sam.Shih <sam.shih@mediatek.com>
+ */
+
+/dts-v1/;
+#include "mt7986b.dtsi"
+
+/ {
+	model = "MediaTek MT7986b RFB";
+	compatible = "mediatek,mt7986b-rfb";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		bootargs = "earlycon=uart8250,mmio32,0x11002000 swiotlb=512";
+	};
+
+	memory {
+		reg = <0 0x40000000 0 0x10000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt7986b.dtsi b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
new file mode 100644
index 000000000000..2b8e0a382398
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt7986b.dtsi
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2021 MediaTek Inc.
+ * Author: Sam.Shih <sam.shih@mediatek.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "mediatek,mt7986b";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	system_clk: dummy40m {
+		compatible = "fixed-clock";
+		clock-frequency = <40000000>;
+		#clock-cells = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x0>;
+			#cooling-cells = <2>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x1>;
+			#cooling-cells = <2>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x2>;
+			#cooling-cells = <2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			enable-method = "psci";
+			compatible = "arm,cortex-a53";
+			reg = <0x3>;
+			#cooling-cells = <2>;
+		};
+	};
+
+	psci {
+		compatible  = "arm,psci-0.2";
+		method      = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
+		secmon_reserved: secmon@43000000 {
+			reg = <0 0x43000000 0 0x30000>;
+			no-map;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
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
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			reg = <0 0x0c000000 0 0x10000>,  /* GICD */
+			      <0 0x0c080000 0 0x80000>,  /* GICR */
+			      <0 0x0c400000 0 0x2000>,   /* GICC */
+			      <0 0x0c410000 0 0x1000>,   /* GICH */
+			      <0 0x0c420000 0 0x2000>;   /* GICV */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		watchdog: watchdog@1001c000 {
+			compatible = "mediatek,mt7986-wdt",
+				     "mediatek,mt6589-wdt";
+			reg = <0 0x1001c000 0 0x1000>;
+			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			#reset-cells = <1>;
+			status = "disabled";
+		};
+
+		trng: trng@1020f000 {
+			compatible = "mediatek,mt7986-rng",
+				     "mediatek,mt7623-rng";
+			reg = <0 0x1020f000 0 0x100>;
+			clocks = <&system_clk>;
+			clock-names = "rng";
+			status = "disabled";
+		};
+
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt7986-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x400>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&system_clk>;
+			status = "disabled";
+		};
+
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt7986-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x400>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&system_clk>;
+			status = "disabled";
+		};
+
+		uart2: serial@11004000 {
+			compatible = "mediatek,mt7986-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11004000 0 0x400>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&system_clk>;
+			status = "disabled";
+		};
+
+	};
+
+};
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
