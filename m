Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76E2C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 06:14:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6759020795
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 06:14:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ICoEAz6s";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kO+EKYyT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6759020795
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P/fGax5lQOhwEloacMubhEcAdFy0xE+45MZbd+erLW4=; b=ICoEAz6syC1GlNIFVHlKezG0T
	AjnfHhwPTnyWbRiJeXAN+brceimMXQLOkXI4Qkg7yqDl+tngWS4JeOxzzghICuXpS+ycw9tl3qWCy
	57L0e4EjOYP2usyJS31YxflxFr2dMftU+eWoz8PpXiZb2504ge0igLRd0gRzL7xnAk+f7YHHIyU5B
	b5RK/djyyrvLcuSMVFqaJ0BCfyZOFa42aMioT574olWtNEMVa+j2qgX6HqDwulzuWolig7sQg9J10
	RVDc847D8KoMT3Kv1RV/mg2eLlBGgosIJX0ZvP953kCHZ+fRSsdvJV1VTsEceyJchiSAkR6eRX0LY
	h+fKL2INQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFqe-0001vW-7r; Thu, 10 Sep 2020 06:14:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFqb-0001uX-Vf; Thu, 10 Sep 2020 06:14:19 +0000
X-UUID: 985da74b947c47e8a05237014f426491-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TX4OFF2swHJPAfFeruhcMP5N68sc1vBDudPNouxnmA4=; 
 b=kO+EKYyTCw0mLKmwIzEYCiO1Uj9PkQXNGu2vw6jX/fq8s/f2BjgPkxMaSjfJNPFbHfvRnBj8cUBbsoDzzPaBKRc/EMYxl6hR657f4RR9ksZ/tL/vcTsgNGdafpflv5hlKA/THCZJp+WVNSCwFqN/YLJGSZFTE+vi78a6Z1V/EDE=;
X-UUID: 985da74b947c47e8a05237014f426491-20200909
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2136944760; Wed, 09 Sep 2020 22:14:15 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 23:14:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 14:14:10 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 14:14:10 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v5 3/4] arm64: dts: mediatek: Split PCIe node for MT2712 and
 MT7622
Date: Thu, 10 Sep 2020 14:11:14 +0800
Message-ID: <20200910061115.909-4-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200910061115.909-1-chuanjia.liu@mediatek.com>
References: <20200910061115.909-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_021418_200657_2794F847 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, linux-pci@vger.kernel.org,
 Chuanjia Liu <chuanjia.liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, yong.wu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There are two independent PCIe controllers in MT2712 and MT7622
platform. Each of them should contain an independent MSI domain.

In current architecture, MSI domain will be inherited from the root
bridge, and all of the devices will share the same MSI domain.
Hence that, the PCIe devices will not work properly if the irq number
which required is more than 32.

Split the PCIe node for MT2712 and MT7622 platform to fix MSI issue
and comply with the hardware design.

Acked-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     | 75 +++++++++++--------
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 16 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |  6 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      | 68 +++++++++++------
 4 files changed, 96 insertions(+), 69 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
index db17d0a4ed57..337e56bdbd08 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt2712e.dtsi
@@ -915,60 +915,73 @@
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
+		slot1: pcie@1,0 {
+			reg = <0x0800 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
 			ranges;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
-					<0 0 0 2 &pcie_intc0 1>,
-					<0 0 0 3 &pcie_intc0 2>,
-					<0 0 0 4 &pcie_intc0 3>;
-			pcie_intc0: interrupt-controller {
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+			pcie_intc1: interrupt-controller {
 				interrupt-controller;
 				#address-cells = <0>;
 				#interrupt-cells = <1>;
 			};
 		};
+	};
 
-		pcie1: pcie@1,0 {
-			device_type = "pci";
-			status = "disabled";
-			reg = <0x0800 0 0 0 0>;
+	pcie0: pcie@11700000 {
+		compatible = "mediatek,mt2712-pcie";
+		device_type = "pci";
+		reg = <0 0x11700000 0 0x1000>;
+		reg-names = "port0";
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
+		slot0: pcie@0,0 {
+			reg = <0x0000 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
 			ranges;
 			interrupt-map-mask = <0 0 0 7>;
-			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
-					<0 0 0 2 &pcie_intc1 1>,
-					<0 0 0 3 &pcie_intc1 2>,
-					<0 0 0 4 &pcie_intc1 3>;
-			pcie_intc1: interrupt-controller {
+			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
+					<0 0 0 2 &pcie_intc0 1>,
+					<0 0 0 3 &pcie_intc0 2>,
+					<0 0 0 4 &pcie_intc0 3>;
+			pcie_intc0: interrupt-controller {
 				interrupt-controller;
 				#address-cells = <0>;
 				#interrupt-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index d174ad214857..83baab46f060 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -207,18 +207,16 @@
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
index 0b4de627f96e..8e98b78ba232 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -183,14 +183,10 @@
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
index 1a39e0ef776b..638b9260b215 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -777,45 +777,41 @@
 		#reset-cells = <1>;
 	};
 
-	pcie: pcie@1a140000 {
+	pciecfg: pciecfg@1a140000 {
+		compatible = "mediatek,mt7622-pciecfg", "syscon";
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
+		mediatek,pcie-cfg = <&pciecfg>;
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
+		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x8000000>;
 		status = "disabled";
 
-		pcie0: pcie@0,0 {
+		slot0: pcie@0,0 {
 			reg = <0x0000 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
 			ranges;
-			status = "disabled";
-
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
 					<0 0 0 2 &pcie_intc0 1>,
@@ -827,15 +823,39 @@
 				#interrupt-cells = <1>;
 			};
 		};
+	};
 
-		pcie1: pcie@1,0 {
+	pcie1: pcie@1a145000 {
+		compatible = "mediatek,mt7622-pcie";
+		device_type = "pci";
+		reg = <0 0x1a145000 0 0x1000>;
+		reg-names = "port1";
+		mediatek,pcie-cfg = <&pciecfg>;
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
+		ranges = <0x82000000 0 0x28000000  0x0 0x28000000  0 0x8000000>;
+		status = "disabled";
+
+		slot1: pcie@1,0 {
 			reg = <0x0800 0 0 0 0>;
 			#address-cells = <3>;
 			#size-cells = <2>;
 			#interrupt-cells = <1>;
 			ranges;
-			status = "disabled";
-
 			interrupt-map-mask = <0 0 0 7>;
 			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
 					<0 0 0 2 &pcie_intc1 1>,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
