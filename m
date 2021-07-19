Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF91C636CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:56:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A4416024A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 07:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A4416024A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+XAZCXqdwrSUVynUTT/NLho1ZV+mXaNDXqE7hPSY5o=; b=TpdbIBYgcDJwqd
	oSEialvjGd5UEfQ5e56mQ8adTyCujXuzaCCC0FsVt6Ib3bSsUCtSLdBhZBhn3wA+YUDl+bZXGK3Ic
	4BflOJ+Q1W34D5wuPtrcjZOhEevGvT0H7r4So5d9TXlFhbTJdfxQ7PpWEn14ISNQFtfCwDbxNvJIe
	CptZnDaSWj22agFXF7JA3iJBqmaezae9EM/yrdQ5UMAITVyh144sjflYmP4+4VdKrDFZMHW3zGncL
	qIlA47ab1ntpxlH8eN0fvc9w4tRmhJ7coalLAslYd5Dji7Oezvt7eobd0u6Bc//9CNxeJacbL0Kp8
	R3bnAH1eb1zYoEqiSHog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5O8P-008hPp-H1; Mon, 19 Jul 2021 07:56:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5O8B-008hOa-DD; Mon, 19 Jul 2021 07:56:05 +0000
X-UUID: 09daca6232314218be2cd9e55273018b-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=t4evhTclRLL3uEaFn/k7IlL1CovaHzN9fbrSKGL0xBU=; 
 b=ec5jYsXL5FasB8CVGkseQk+zW8EXbuQiH3u8NQAHeIcrPIOaQEPSgRZ/BOXKq6Q6dFVCnqqMHzRScK6lltLlSs2ILxLZyM6Z/JX3WS6DcXPPDi3CbGfhaT0o0g2ooJCGOsfERGz2yEgWCFAQJCOIsGHt5Pr6DQhlcTWChasn8BA=;
X-UUID: 09daca6232314218be2cd9e55273018b-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 250706185; Mon, 19 Jul 2021 00:56:00 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 00:51:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 15:36:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 19 Jul 2021 15:36:17 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
 <lorenzo.pieralisi@arm.com>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>,
 <chuanjia.liu@mediatek.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 3/4] arm64: dts: mediatek: Split PCIe node for MT2712 and
 MT7622
Date: Mon, 19 Jul 2021 15:34:55 +0800
Message-ID: <20210719073456.28666-4-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
References: <20210719073456.28666-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_005603_513625_44ADE0F7 
X-CRM114-Status: GOOD (  13.23  )
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

There are two independent PCIe controllers in MT2712 and MT7622
platform. Each of them should contain an independent MSI domain.

In old dts architecture, MSI domain will be inherited from the root
bridge, and all of the devices will share the same MSI domain.
Hence that, the PCIe devices will not work properly if the irq number
which required is more than 32.

Split the PCIe node for MT2712 and MT7622 platform to comply with
the hardware design and fix MSI issue.

Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |  97 +++++++--------
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  16 ++-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   6 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      | 112 ++++++++++--------
 4 files changed, 118 insertions(+), 113 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index a9cca9c146fd..de16c0d80c30 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -915,64 +915,67 @@
 		};
 	};
 
-	pcie: pcie@11700000 {
+	pcie1: pcie@112ff000 {
 		compatible = "mediatek,mt2712-pcie";
 		device_type = "pci";
-		reg = <0 0x11700000 0 0x1000>,
-		      <0 0x112ff000 0 0x1000>;
-		reg-names = "port0", "port1";
+		reg = <0 0x112ff000 0 0x1000>;
+		reg-names = "port1";
+		linux,pci-domain = <1>;
 		#address-cells = <3>;
 		#size-cells = <2>;
-		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&topckgen CLK_TOP_PE2_MAC_P0_SEL>,
-			 <&topckgen CLK_TOP_PE2_MAC_P1_SEL>,
-			 <&pericfg CLK_PERI_PCIE0>,
+		interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "pcie_irq";
+		clocks = <&topckgen CLK_TOP_PE2_MAC_P1_SEL>,
 			 <&pericfg CLK_PERI_PCIE1>;
-		clock-names = "sys_ck0", "sys_ck1", "ahb_ck0", "ahb_ck1";
-		phys = <&u3port0 PHY_TYPE_PCIE>, <&u3port1 PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy0", "pcie-phy1";
+		clock-names = "sys_ck1", "ahb_ck1";
+		phys = <&u3port1 PHY_TYPE_PCIE>;
+		phy-names = "pcie-phy1";
 		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x10000000>;
+		ranges = <0x82000000 0 0x11400000  0x0 0x11400000  0 0x300000>;
+		status = "disabled";
 
-		pcie0: pcie@0,0 {
-			device_type = "pci";
-			status = "disabled";
-			reg = <0x0000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+				<0 0 0 2 &pcie_intc1 1>,
+				<0 0 0 3 &pcie_intc1 2>,
+				<0 0 0 4 &pcie_intc1 3>;
+		pcie_intc1: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <1>;
-			ranges;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-					<0 0 0 2 &pcie_intc0 1>,
-					<0 0 0 3 &pcie_intc0 2>,
-					<0 0 0 4 &pcie_intc0 3>;
-			pcie_intc0: interrupt-controller {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-			};
 		};
+	};
 
-		pcie1: pcie@1,0 {
-			device_type = "pci";
-			status = "disabled";
-			reg = <0x0800 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
+	pcie0: pcie@11700000 {
+		compatible = "mediatek,mt2712-pcie";
+		device_type = "pci";
+		reg = <0 0x11700000 0 0x1000>;
+		reg-names = "port0";
+		linux,pci-domain = <0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "pcie_irq";
+		clocks = <&topckgen CLK_TOP_PE2_MAC_P0_SEL>,
+			 <&pericfg CLK_PERI_PCIE0>;
+		clock-names = "sys_ck0", "ahb_ck0";
+		phys = <&u3port0 PHY_TYPE_PCIE>;
+		phy-names = "pcie-phy0";
+		bus-range = <0x00 0xff>;
+		ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x10000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+				<0 0 0 2 &pcie_intc0 1>,
+				<0 0 0 3 &pcie_intc0 2>,
+				<0 0 0 4 &pcie_intc0 3>;
+		pcie_intc0: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <1>;
-			ranges;
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
-					<0 0 0 2 &pcie_intc1 1>,
-					<0 0 0 3 &pcie_intc1 2>,
-					<0 0 0 4 &pcie_intc1 3>;
-			pcie_intc1: interrupt-controller {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-			};
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 2f77dc40b9b8..2b9bf8dd14ec 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -257,18 +257,16 @@
 	};
 };
 
-&pcie {
+&pcie0 {
 	pinctrl-names = "default";
-	pinctrl-0 = <&pcie0_pins>, <&pcie1_pins>;
+	pinctrl-0 = <&pcie0_pins>;
 	status = "okay";
+};
 
-	pcie@0,0 {
-		status = "okay";
-	};
-
-	pcie@1,0 {
-		status = "okay";
-	};
+&pcie1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_pins>;
+	status = "okay";
 };
 
 &pio {
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index f2dc850010f1..596c073d8b05 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -234,14 +234,10 @@
 	};
 };
 
-&pcie {
+&pcie0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_pins>;
 	status = "okay";
-
-	pcie@0,0 {
-		status = "okay";
-	};
 };
 
 &pio {
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 890a942ec608..6f8cb3ad1e84 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -781,75 +781,83 @@
 		#reset-cells = <1>;
 	};
 
-	pcie: pcie@1a140000 {
+	pciecfg: pciecfg@1a140000 {
+		compatible = "mediatek,generic-pciecfg", "syscon";
+		reg = <0 0x1a140000 0 0x1000>;
+	};
+
+	pcie0: pcie@1a143000 {
 		compatible = "mediatek,mt7622-pcie";
 		device_type = "pci";
-		reg = <0 0x1a140000 0 0x1000>,
-		      <0 0x1a143000 0 0x1000>,
-		      <0 0x1a145000 0 0x1000>;
-		reg-names = "subsys", "port0", "port1";
+		reg = <0 0x1a143000 0 0x1000>;
+		reg-names = "port0";
+		linux,pci-domain = <0>;
 		#address-cells = <3>;
 		#size-cells = <2>;
-		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>,
-			     <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "pcie_irq";
 		clocks = <&pciesys CLK_PCIE_P0_MAC_EN>,
-			 <&pciesys CLK_PCIE_P1_MAC_EN>,
-			 <&pciesys CLK_PCIE_P0_AHB_EN>,
 			 <&pciesys CLK_PCIE_P0_AHB_EN>,
 			 <&pciesys CLK_PCIE_P0_AUX_EN>,
-			 <&pciesys CLK_PCIE_P1_AUX_EN>,
 			 <&pciesys CLK_PCIE_P0_AXI_EN>,
-			 <&pciesys CLK_PCIE_P1_AXI_EN>,
 			 <&pciesys CLK_PCIE_P0_OBFF_EN>,
-			 <&pciesys CLK_PCIE_P1_OBFF_EN>,
-			 <&pciesys CLK_PCIE_P0_PIPE_EN>,
-			 <&pciesys CLK_PCIE_P1_PIPE_EN>;
-		clock-names = "sys_ck0", "sys_ck1", "ahb_ck0", "ahb_ck1",
-			      "aux_ck0", "aux_ck1", "axi_ck0", "axi_ck1",
-			      "obff_ck0", "obff_ck1", "pipe_ck0", "pipe_ck1";
+			 <&pciesys CLK_PCIE_P0_PIPE_EN>;
+		clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
+			      "axi_ck0", "obff_ck0", "pipe_ck0";
+
 		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
 		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x10000000>;
+		ranges = <0x82000000 0 0x20000000 0x0 0x20000000 0 0x8000000>;
 		status = "disabled";
 
-		pcie0: pcie@0,0 {
-			reg = <0x0000 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+				<0 0 0 2 &pcie_intc0 1>,
+				<0 0 0 3 &pcie_intc0 2>,
+				<0 0 0 4 &pcie_intc0 3>;
+		pcie_intc0: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <1>;
-			ranges;
-			status = "disabled";
-
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-					<0 0 0 2 &pcie_intc0 1>,
-					<0 0 0 3 &pcie_intc0 2>,
-					<0 0 0 4 &pcie_intc0 3>;
-			pcie_intc0: interrupt-controller {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-			};
 		};
+	};
 
-		pcie1: pcie@1,0 {
-			reg = <0x0800 0 0 0 0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
+	pcie1: pcie@1a145000 {
+		compatible = "mediatek,mt7622-pcie";
+		device_type = "pci";
+		reg = <0 0x1a145000 0 0x1000>;
+		reg-names = "port1";
+		linux,pci-domain = <1>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "pcie_irq";
+		clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
+			 /* designer has connect RC1 with p0_ahb clock */
+			 <&pciesys CLK_PCIE_P0_AHB_EN>,
+			 <&pciesys CLK_PCIE_P1_AUX_EN>,
+			 <&pciesys CLK_PCIE_P1_AXI_EN>,
+			 <&pciesys CLK_PCIE_P1_OBFF_EN>,
+			 <&pciesys CLK_PCIE_P1_PIPE_EN>;
+		clock-names = "sys_ck1", "ahb_ck1", "aux_ck1",
+			      "axi_ck1", "obff_ck1", "pipe_ck1";
+
+		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
+		bus-range = <0x00 0xff>;
+		ranges = <0x82000000 0 0x28000000 0x0 0x28000000 0 0x8000000>;
+		status = "disabled";
+
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 7>;
+		interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+				<0 0 0 2 &pcie_intc1 1>,
+				<0 0 0 3 &pcie_intc1 2>,
+				<0 0 0 4 &pcie_intc1 3>;
+		pcie_intc1: interrupt-controller {
+			interrupt-controller;
+			#address-cells = <0>;
 			#interrupt-cells = <1>;
-			ranges;
-			status = "disabled";
-
-			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
-					<0 0 0 2 &pcie_intc1 1>,
-					<0 0 0 3 &pcie_intc1 2>,
-					<0 0 0 4 &pcie_intc1 3>;
-			pcie_intc1: interrupt-controller {
-				interrupt-controller;
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-			};
 		};
 	};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
