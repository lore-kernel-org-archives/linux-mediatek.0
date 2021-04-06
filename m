Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2FAC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:48:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2396E611EE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2396E611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eT0+DJvFoPUNRFYVtTMKcUDNkwLb19ztIzUbHrFLXhc=; b=ZaWm8NdWAO/DhJ6kCKx9CCIBn
	xIfAIrAOnD5XFsgzsGlxj2udYLocra2wgx0uv1Y1e1PLpipFdxpGigB7vq9nTEA1uuUgJbbgRnVYh
	avjQQQ9JPtaiJNd+5chUFABXpOeTcDundnBNwSJRO+UM4CeFE/fZC9VZph+1A4OR52nmmVwgI768K
	spQfb+np23SCPCFx813UWoh4VRtxTUT0YASvZWNcbKfZMsva/CEHOxuYuLov27kvh5IlZ0GP91EC0
	n3l+HpQ7lQ3lkKcRfh8hiQQk33kHAU8g0Gt5WwprNbKTeHXeFxmrw/U1k1ahovvkpbUSvOxLp4uT6
	Ot4dbJGbQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTchL-001NTj-It; Tue, 06 Apr 2021 03:48:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTch8-001NOh-R5; Tue, 06 Apr 2021 03:48:05 +0000
X-UUID: f5766b5a86a04fa99a0cd124ae6b78de-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=a5C6UzpMg+gixpQeFhpYQidpXjT+jv8RHp/rAKGEXJc=; 
 b=k3l6fUFkHyISuuIDDFOmqh0Q6DKnd6FyHs7m/2h2cl9DV/a2bpoEKGeR/ABJcMQw60AvwEGLw4JcFTKtfK/pyTwLLwbIRDPfQ9KhR3E1Gp6S+WJYYmIrdBYobKX+if0ZpTQWYxX9bq3QdgzQq/zPb38QrKgwcb26RjZ2DArLsEQ=;
X-UUID: f5766b5a86a04fa99a0cd124ae6b78de-20210405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1765055888; Mon, 05 Apr 2021 20:47:55 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 20:44:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 11:44:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Apr 2021 11:44:43 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <ryder.lee@mediatek.com>, <lorenzo.pieralisi@arm.com>,
 <jianjun.wang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <yong.wu@mediatek.com>, <frank-w@public-files.de>
Subject: [PATCH v9 1/4] dt-bindings: PCI: mediatek: Update the Device tree
 bindings
Date: Tue, 6 Apr 2021 11:44:07 +0800
Message-ID: <20210406034410.24381-2-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
References: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: B0C126CC02963B50B38A0B3DCF726C314BC7337FEB450B9A9530D597E0CB64092000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_044803_549177_A7FB00FF 
X-CRM114-Status: GOOD (  14.83  )
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
Reviewed-by: Rob Herring <robh@kernel.org>

---
 .../bindings/pci/mediatek-pcie-cfg.yaml       |  39 ++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 201 ++++++++++--------
 2 files changed, 146 insertions(+), 94 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
new file mode 100644
index 000000000000..841a3d284bbf
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-cfg.yaml
@@ -0,0 +1,39 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/mediatek-pcie-cfg.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek PCIECFG controller
+
+maintainers:
+  - Chuanjia Liu <chuanjia.liu@mediatek.com>
+  - Jianjun Wang <jianjun.wang@mediatek.com>
+
+description: |
+  The MediaTek PCIECFG controller controls some feature about
+  LTSSM, ASPM and so on.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - mediatek,generic-pciecfg
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pciecfg: pciecfg@1a140000 {
+        compatible = "mediatek,generic-pciecfg", "syscon";
+        reg = <0x1a140000 0x1000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
index 7468d666763a..604792c9b1dc 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie.txt
@@ -8,7 +8,7 @@ Required properties:
 	"mediatek,mt7623-pcie"
 	"mediatek,mt7629-pcie"
 - device_type: Must be "pci"
-- reg: Base addresses and lengths of the PCIe subsys and root ports.
+- reg: Base addresses and lengths of the root ports.
 - reg-names: Names of the above areas to use during resource lookup.
 - #address-cells: Address representation for root ports (must be 3)
 - #size-cells: Size representation for root ports (must be 2)
@@ -143,130 +143,143 @@ Examples for MT7623:
 
 Examples for MT2712:
 
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
-		phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy0", "pcie-phy1";
+		clock-names = "sys_ck1", "ahb_ck1";
+		phys = <&u3port1 PHY_TYPE_PCIE>;
+		phy-names = "pcie-phy1";
 		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x10000000>;
+		ranges = <0x82000000 0 0x11400000  0x0 0x11400000  0 0x300000>;
+		status = "disabled";
 
-		pcie0: pcie@0,0 {
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
 
 Examples for MT7622:
 
-	pcie: pcie@1a140000 {
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
 			 <&pciesys CLK_PCIE_P0_AHB_EN>,
-			 <&pciesys CLK_PCIE_P1_AHB_EN>,
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
-		phys = <&pcie0_phy PHY_TYPE_PCIE>, <&pcie1_phy PHY_TYPE_PCIE>;
-		phy-names = "pcie-phy0", "pcie-phy1";
+			 <&pciesys CLK_PCIE_P0_PIPE_EN>;
+		clock-names = "sys_ck0", "ahb_ck0", "aux_ck0",
+			      "axi_ck0", "obff_ck0", "pipe_ck0";
+
 		power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
 		bus-range = <0x00 0xff>;
-		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x10000000>;
+		ranges = <0x82000000 0 0x20000000  0x0 0x20000000  0 0x8000000>;
+		status = "disabled";
 
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
+		ranges = <0x82000000 0 0x28000000  0x0 0x28000000  0 0x8000000>;
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
