Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE6AC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:37:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48E4161554
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 06:37:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48E4161554
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RXhxt7Zd1Qgo01TlGi++ZhATYQ7qSyz50jVFCjL0Rsk=; b=UuECKuM4YK01GutFGvLYuNwvA
	zymTUqzQNnmpQ+amcC2amRwHp2j2jcvpt5pCmwpjNMOXzlnJzpL9lBHB3NAHxYn3VRSmZJa79sHvl
	WnCG23tjCVdP2qPGMZ3YPoUUQPAao8aTj8WVu1yfFqYBwFISGiOxRPU2+Ej0jLXTKu6nddM0zsuqJ
	7Jk6RjJbFfrA/cfw3rbZfLU4w/JrzZfU2fyptDENduUgIPSNBwJZLq1d0ovK5aRWAWQV1Y4yljDmm
	zLeM1Wx6y8LGJKIzAEjkUa9SVwMdYsUMXcvIFXiBRNjwFyMQw7Q2Xm/SevQDFXOem0yUXX9n8In3s
	Kicxxm+4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJsTT-0068NB-NQ; Wed, 10 Mar 2021 06:37:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJsSy-0068IZ-H8; Wed, 10 Mar 2021 06:37:14 +0000
X-UUID: 885b332761f342c496255a6f19d5d72b-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=dS94g7LEXgdJQAZkCDBUjA09AkbYYaxvtlnWRuiqTQ0=; 
 b=PMZeWQblO5jscQJty0uN8COCWYuTtVz1tjkb2rq6XSeRKbITcOWLZ92PWnijgl8X5eq/E9BfT8kh2gG7EBKkndi/Gja9oRaufVbLM+8yeGx+GyWFH1oPyS6ZXFcV3V+RfeAfmmC5VU6yvNLAlmTaCkvdQt9a1bWePVyKkIsurYw=;
X-UUID: 885b332761f342c496255a6f19d5d72b-20210309
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 600915949; Tue, 09 Mar 2021 22:37:04 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 22:37:03 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Mar 2021 14:37:00 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 10 Mar 2021 14:37:01 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Wendell Lin
 <Wendell.Lin@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Weiyi Lu
 <weiyi.lu@mediatek.com>, Mars Cheng <mars.cheng@mediatek.com>, Sean Wang
 <Sean.Wang@mediatek.com>, Macpaul Lin <Macpaul.Lin@mediatek.com>, Owen Chen
 <owen.chen@mediatek.com>, Evan Green <evgreen@chromium.org>,
 <Yong.Wu@mediatek.com>, Joerg Roedel <jroedel@suse.de>, Shawn Guo
 <shawnguo@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Ryder Lee
 <Ryder.Lee@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Ainge Hsu <ainge.hsu@mediatek.com>, Eddie Hung <eddie.hung@mediatek.com>, 
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, CC Hwang
 <cc.hwang@mediatek.com>, Loda Chou <loda.chou@mediatek.com>
Subject: [PATCH v10 3/4] arm64: dts: mediatek: add mt6765 support
Date: Wed, 10 Mar 2021 14:36:57 +0800
Message-ID: <1615358218-6540-4-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
References: <1615291538-9799-1-git-send-email-macpaul.lin@mediatek.com>
 <1615358218-6540-1-git-send-email-macpaul.lin@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 64A005C794A51ABA5FCB7D2679829AE427C1F5F19547245A894D6F43403FF7372000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_063709_872412_88C1A2D6 
X-CRM114-Status: GOOD (  16.82  )
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

From: Mars Cheng <mars.cheng@mediatek.com>

Add basic chip support for Mediatek 6765, include
uart node with correct uart clocks, pwrap device

Add clock controller nodes, include topckgen, infracfg,
apmixedsys and subsystem.

Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Owen Chen <owen.chen@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Acked-by: Marc Zyngier <marc.zyngier@arm.com>
---
 arch/arm64/boot/dts/mediatek/Makefile       |   1 +
 arch/arm64/boot/dts/mediatek/mt6765-evb.dts |  33 +++
 arch/arm64/boot/dts/mediatek/mt6765.dtsi    | 252 ++++++++++++++++++++
 3 files changed, 286 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6765-evb.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6765.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index deba27ab7657..176c817f9f9a 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt2712-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6755-evb.dtb
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt6765-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6779-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6795-evb.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt6797-evb.dtb
diff --git a/arch/arm64/boot/dts/mediatek/mt6765-evb.dts b/arch/arm64/boot/dts/mediatek/mt6765-evb.dts
new file mode 100644
index 000000000000..36dddff2b7f8
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6765-evb.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for Mediatek MT6765
+ *
+ * (C) Copyright 2018. Mediatek, Inc.
+ *
+ * Mars Cheng <mars.cheng@mediatek.com>
+ */
+
+/dts-v1/;
+#include "mt6765.dtsi"
+
+/ {
+	model = "MediaTek MT6765 EVB";
+	compatible = "mediatek,mt6765-evb", "mediatek,mt6765";
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
diff --git a/arch/arm64/boot/dts/mediatek/mt6765.dtsi b/arch/arm64/boot/dts/mediatek/mt6765.dtsi
new file mode 100644
index 000000000000..21683f3e1a3f
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6765.dtsi
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for Mediatek MT6765
+ *
+ * (C) Copyright 2018. Mediatek, Inc.
+ *
+ * Mars Cheng <mars.cheng@mediatek.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/mt6765-clk.h>
+
+/ {
+	compatible = "mediatek,mt6765";
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
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x000>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x001>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x002>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x003>;
+		};
+
+		cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x100>;
+		};
+
+		cpu@101 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x101>;
+		};
+
+		cpu@102 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x102>;
+		};
+
+		cpu@103 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			enable-method = "psci";
+			reg = <0x103>;
+		};
+	};
+
+	clocks {
+		clk26m: clk26m {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <26000000>;
+		};
+
+		clk32k: clk32k {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
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
+			#address-cells = <2>;
+			#size-cells = <2>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
+			      <0 0x0c100000 0 0x200000>, /* GICR */
+			      <0 0x0c400000 0 0x2000>,   /* GICC */
+			      <0 0x0c410000 0 0x2000>,   /* GICH */
+			      <0 0x0c420000 0 0x20000>;  /* GICV */
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
+		topckgen: syscon@10000000 {
+			compatible = "mediatek,mt6765-topckgen", "syscon";
+			reg = <0 0x10000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		infracfg: syscon@10001000 {
+			compatible = "mediatek,mt6765-infracfg", "syscon";
+			reg = <0 0x10001000 0 0x1000>;
+			interrupts = <GIC_SPI 147 IRQ_TYPE_EDGE_RISING>;
+			#clock-cells = <1>;
+		};
+
+		pericfg: pericfg@10003000 {
+			compatible = "mediatek,mt6765-pericfg", "syscon";
+			reg = <0 0x10003000 0 0x1000>;
+		};
+
+		scpsys: scpsys@10006000 {
+			compatible = "mediatek,mt6765-scpsys";
+			reg =	<0 0x10006000 0 0x1000>; /* spm */
+			#power-domain-cells = <1>;
+			clocks = <&topckgen CLK_TOP_MFG_SEL>,
+				 <&topckgen CLK_TOP_MM_SEL>,
+				 <&mmsys_config CLK_MM_SMI_COMMON>,
+				 <&mmsys_config CLK_MM_SMI_COMM0>,
+				 <&mmsys_config CLK_MM_SMI_COMM1>,
+				 <&mmsys_config CLK_MM_SMI_LARB0>,
+				 <&imgsys CLK_IMG_LARB2>,
+				 <&mmsys_config CLK_MM_SMI_IMG>,
+				 <&camsys CLK_CAM_LARB3>,
+				 <&camsys CLK_CAM_DFP_VAD>,
+				 <&camsys CLK_CAM>,
+				 <&camsys CLK_CAM_CCU>,
+				 <&mmsys_config CLK_MM_SMI_CAM>;
+			clock-names = "mfg", "mm",
+				      "mm-0", "mm-1", "mm-2", "mm-3",
+				      "isp-0", "isp-1", "cam-0", "cam-1",
+				      "cam-2", "cam-3", "cam-4";
+			infracfg = <&infracfg>;
+			smi_comm = <&smi_common>;
+		};
+
+		apmixed: syscon@1000c000 {
+			compatible = "mediatek,mt6765-apmixedsys", "syscon";
+			reg = <0 0x1000c000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		sysirq: interrupt-controller@10200a80 {
+			compatible = "mediatek,mt6765-sysirq",
+				     "mediatek,mt6577-sysirq";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			reg = <0 0x10200a80 0 0x50>;
+		};
+
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt6765-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x400>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_IFR_UART0>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt6765-uart",
+				     "mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x400>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
+			clocks = <&infracfg CLK_IFR_UART1>,
+				 <&infracfg CLK_IFR_AP_DMA>;
+			clock-names = "baud", "bus";
+			status = "disabled";
+		};
+
+		audio: syscon@11220000 {
+			compatible = "mediatek,mt6765-audsys", "syscon";
+			reg = <0 0x11220000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mipi_rx_ana_csi0a: syscon@11c10000 {
+			compatible = "mediatek,mt6765-mipi0a",
+				     "syscon";
+			reg = <0 0x11c10000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		mmsys_config: syscon@14000000 {
+			compatible = "mediatek,mt6765-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		smi_common: smi@14002000 {
+			compatible = "mediatek,mt6765-smi-common", "syscon";
+			reg = <0 0x14002000 0 0x1000>;
+		};
+
+		imgsys: syscon@15020000 {
+			compatible = "mediatek,mt6765-imgsys", "syscon";
+			reg = <0 0x15020000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		venc_gcon: syscon@17000000 {
+			compatible = "mediatek,mt6765-vcodecsys", "syscon";
+			reg = <0 0x17000000 0 0x10000>;
+			#clock-cells = <1>;
+		};
+
+		camsys: syscon@1a000000  {
+			compatible = "mediatek,mt6765-camsys", "syscon";
+			reg = <0 0x1a000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
+	}; /* end of soc */
+};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
