Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028B0C4743D
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 06:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA9CA6128A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 06:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA9CA6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SM/Exwevd2niRTvMQ/15EXfDxJ6xSzIDYd+fm9jMvIY=; b=dkKjAd4O5JK08L
	I5ZO2K0KsE0Pp0KKZllgoj86W/98VrlvR9ZBhFayOJuAmoQwL7ViYYP3RtBztFtUKQzcDdzI4oeq8
	6oRh/mui9E2VjfQp4/lrbqH1VcY2gN2DInbOdDhTwd9WnQ5ThkxdAmzdcAW8wfCYmFI1odr57thXd
	nYXGpwiViszm2drGHJsD5rSqfFK2h2sVxEnxqg3i4YIrCjtHCT1SpIHNMOFBzOPFRebKW0/EF9tP1
	Rg1LraQSRsm0GRQtodJ5h88XOMQinI88nf5gVdbeq7fdS0WyuLzsIVFRHLIcHovQ+QX8c+CthxAp1
	SxEma9iOg4DYYc5Mx2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lraO4-003laD-BO; Fri, 11 Jun 2021 06:11:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lraO2-003lXc-7u; Fri, 11 Jun 2021 06:11:23 +0000
X-UUID: 203562d8c04d46038d9896a029b62313-20210610
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wjkBJaGWpu0hqvEhULa6KG6C1ro9VL1lR5Rvb6F9RBU=; 
 b=UAVRdOnsmQ74oZ1UMfyjyCRLK2XQ/p6dBQmuhMHCT2Yh78cDNpJFRG2bZDMaHDMaPMyBGzUvRvVgUrQhAS/fucyK7cYb2OfnfocB8hE+yWm96VFY1LXIToq1tqZpqs9MWIhwtjH7mUkA+rxbsJnGuBkY9tIkJwl+AWzYX3ikrbI=;
X-UUID: 203562d8c04d46038d9896a029b62313-20210610
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1423335739; Thu, 10 Jun 2021 23:11:18 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Jun 2021 23:11:16 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Jun 2021 14:11:14 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Jun 2021 14:11:13 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <lorenzo.pieralisi@arm.com>, <robh+dt@kernel.org>, <bhelgaas@google.com>, 
 <matthias.bgg@gmail.com>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v10 4/4] ARM: dts: mediatek: Update MT7629 PCIe node for new
 format
Date: Fri, 11 Jun 2021 14:09:02 +0800
Message-ID: <20210611060902.12418-5-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210611060902.12418-1-chuanjia.liu@mediatek.com>
References: <20210611060902.12418-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_231122_320259_28F9FDF3 
X-CRM114-Status: GOOD (  11.52  )
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

To match the new dts binding. Remove "subsys",unused
interrupt and slot node.Add "interrupt-names",
"linux,pci-domain" and pciecfg node.

Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 arch/arm/boot/dts/mt7629-rfb.dts |  3 ++-
 arch/arm/boot/dts/mt7629.dtsi    | 45 +++++++++++++++-----------------
 2 files changed, 23 insertions(+), 25 deletions(-)

diff --git a/arch/arm/boot/dts/mt7629-rfb.dts b/arch/arm/boot/dts/mt7629-rfb.dts
index 9980c10c6e29..eb536cbebd9b 100644
--- a/arch/arm/boot/dts/mt7629-rfb.dts
+++ b/arch/arm/boot/dts/mt7629-rfb.dts
@@ -140,9 +140,10 @@
 	};
 };
 
-&pcie {
+&pcie1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie_pins>;
+	status = "okay";
 };
 
 &pciephy1 {
diff --git a/arch/arm/boot/dts/mt7629.dtsi b/arch/arm/boot/dts/mt7629.dtsi
index 874043f0490d..46fc236e1b89 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -361,16 +361,21 @@
 			#reset-cells = <1>;
 		};
 
-		pcie: pcie@1a140000 {
+		pciecfg: pciecfg@1a140000 {
+			compatible = "mediatek,generic-pciecfg", "syscon";
+			reg = <0x1a140000 0x1000>;
+		};
+
+		pcie1: pcie@1a145000 {
 			compatible = "mediatek,mt7629-pcie";
 			device_type = "pci";
-			reg = <0x1a140000 0x1000>,
-			      <0x1a145000 0x1000>;
-			reg-names = "subsys","port1";
+			reg = <0x1a145000 0x1000>;
+			reg-names = "port1";
+			linux,pci-domain = <1>;
 			#address-cells = <3>;
 			#size-cells = <2>;
-			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_LOW>,
-				     <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "pcie_irq";
 			clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
 				 <&pciesys CLK_PCIE_P0_AHB_EN>,
 				 <&pciesys CLK_PCIE_P1_AUX_EN>,
@@ -391,26 +396,18 @@
 			power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
 			bus-range = <0x00 0xff>;
 			ranges = <0x82000000 0 0x20000000 0x20000000 0 0x10000000>;
+			status = "disabled";
 
-			pcie1: pcie@1,0 {
-				device_type = "pci";
-				reg = <0x0800 0 0 0 0>;
-				#address-cells = <3>;
-				#size-cells = <2>;
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 7>;
+			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
+					<0 0 0 2 &pcie_intc1 1>,
+					<0 0 0 3 &pcie_intc1 2>,
+					<0 0 0 4 &pcie_intc1 3>;
+			pcie_intc1: interrupt-controller {
+				interrupt-controller;
+				#address-cells = <0>;
 				#interrupt-cells = <1>;
-				ranges;
-				num-lanes = <1>;
-				interrupt-map-mask = <0 0 0 7>;
-				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
-						<0 0 0 2 &pcie_intc1 1>,
-						<0 0 0 3 &pcie_intc1 2>,
-						<0 0 0 4 &pcie_intc1 3>;
-
-				pcie_intc1: interrupt-controller {
-					interrupt-controller;
-					#address-cells = <0>;
-					#interrupt-cells = <1>;
-				};
 			};
 		};
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
