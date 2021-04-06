Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF54BC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:45:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 801556138B
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 03:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 801556138B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LhhVrNbAQA90QoJ5Ehdk/DRFzr4HP1o2ZaBx61+J9Jk=; b=coBVJznDUTdmPt2N3Oh6o9qif
	EqphxX0NFyguIPCDGTix+JO/PJXIvuxTuz2JCsBrRPlDI8Gw7QtZFM4ZCouRaTcbLfV0rMbnW7RSf
	YWvS2b3A7rUO1V5x7IkAOWWSvAaNs9kQcc8v6KHeI3GNTILI4pVIcjsPyEgw/lRQDHtZnL8zIgITF
	LaXelpUzgAXiMfgWEaIBWc4SPie0j9INyHUPsKO/2RmwsTYKyxiP+hkTnhOm2gTXoKGb9Y6eFK9kf
	GhKLn5DvVp35yN6d14fUs1jAtVv2yVI9U1XWoCPsJCzKYybJMw2LOA4qIGJUnzHBPJHg+6Hzl/MVs
	ko4VqB4hg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTcem-001Mst-5g; Tue, 06 Apr 2021 03:45:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTceN-001MnZ-Rp; Tue, 06 Apr 2021 03:45:13 +0000
X-UUID: 3439cac0123b45e29f2faafd84cda98f-20210405
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zCrVi0NJxTHn8yJuVpjxMpugcmZsEASet3iw1efMzx8=; 
 b=qoBIyQbvhRvXGFpsK0mCLjnl7e7WPVa6wXk+U90Kfjge3wO1Yi6M9/wma9HRHh3WOfkb74k7a3oleuRgj5SY62z39TzQ0hO688YAjOybSVUNK+XHRPwY4G5w+S6sMnYTWzUx59AW8ZGmjcuBkCS189WgD5EgEwa06HaPyEqRhWI=;
X-UUID: 3439cac0123b45e29f2faafd84cda98f-20210405
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 389382009; Mon, 05 Apr 2021 20:45:07 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Apr 2021 20:45:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 11:45:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Apr 2021 11:45:03 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>
CC: <ryder.lee@mediatek.com>, <lorenzo.pieralisi@arm.com>,
 <jianjun.wang@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <yong.wu@mediatek.com>, <frank-w@public-files.de>
Subject: [PATCH v9 4/4] ARM: dts: mediatek: Update MT7629 PCIe node for new
 format
Date: Tue, 6 Apr 2021 11:44:10 +0800
Message-ID: <20210406034410.24381-5-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
References: <20210406034410.24381-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_044512_283084_C59F736C 
X-CRM114-Status: GOOD (  11.45  )
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
index 5cbb3d244c75..ca6789acf057 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -360,16 +360,21 @@
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
@@ -390,26 +395,18 @@
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
