Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D8BC433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 06:14:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E61F207FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 06:14:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EM+bruSn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nTfkAeXk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E61F207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2uPBxyBXfXOqwoQ0DiKak1/yQWpNuf8ikqjjxfDRPAA=; b=EM+bruSn3rX+gwWdcGwfLTXUV
	PIm/MkJTB4/6DmQXfd6ABkbzxS+iwip54eITbRooMce7uXPwTTmJ9W6A3ZGuDTkoUGH2Uvty3zgBG
	/94pyeyMKiQPfKygvHPSp9xa/Ns0wVyBMTijpZ/Yy1v2oV52rz7znd8pAETfBEs82bu4pOHL2XSiA
	mv2KWiNXbpGSeAiLtvdeBUQtFOZeCdWhGKkUSojpDtiUFOs0MKRyjAdJR0aSGqnj/D+DiC67rZzPS
	sG1fe8nvxVuRBP3qtrSF1DKadRx0RbS/AYnes452XFKa8AsKWKsEdATxobJmVS4Wuf0X78eeJSsPG
	ovAJGT5nw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGFqt-00023M-1B; Thu, 10 Sep 2020 06:14:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGFqq-00021V-8t; Thu, 10 Sep 2020 06:14:33 +0000
X-UUID: 1bc9ea32d5d54fa3acb80f0fe1a010ed-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=xloUjBE6OF+ENLRHth9hL5fNUGfyOv8h8Vtqb+yulXk=; 
 b=nTfkAeXkYYvzFy0uVMmVgpJ6yeJqDAgad8mtu/eppQ4AH3uDiSnxGTifiskLsMbBrPTaCzkdSpsVk6Z4vEEjrKYzTACl/RdrkBPpYmWDdoXWQCeeNeH4YvTwg6H0XWyOQ//5HGKlFr+SVrDld5u4PQoSOObfiq9nPSBF7gWvGH8=;
X-UUID: 1bc9ea32d5d54fa3acb80f0fe1a010ed-20200909
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1075777367; Wed, 09 Sep 2020 22:14:29 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 23:14:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Sep 2020 14:14:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Sep 2020 14:14:24 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [PATCH v5 4/4] ARM: dts: mediatek: Modified MT7629 PCIe node
Date: Thu, 10 Sep 2020 14:11:15 +0800
Message-ID: <20200910061115.909-5-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200910061115.909-1-chuanjia.liu@mediatek.com>
References: <20200910061115.909-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 06F033A27D6FEFF1385F1BA824970B003F89F257B2FE2FFDC1AA77B79BE1042B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_021432_474729_B79CBED0 
X-CRM114-Status: GOOD (  11.02  )
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

Remove unused property and add pciecfg node.

Acked-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
---
 arch/arm/boot/dts/mt7629-rfb.dts |  3 ++-
 arch/arm/boot/dts/mt7629.dtsi    | 23 +++++++++++++----------
 2 files changed, 15 insertions(+), 11 deletions(-)

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
index 5cbb3d244c75..94567307b842 100644
--- a/arch/arm/boot/dts/mt7629.dtsi
+++ b/arch/arm/boot/dts/mt7629.dtsi
@@ -360,16 +360,21 @@
 			#reset-cells = <1>;
 		};
 
-		pcie: pcie@1a140000 {
+		pciecfg: pciecfg@1a140000 {
+			compatible = "mediatek,mt7629-pciecfg", "syscon";
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
+			mediatek,pcie-cfg = <&pciecfg>;
 			#address-cells = <3>;
 			#size-cells = <2>;
-			interrupts = <GIC_SPI 176 IRQ_TYPE_LEVEL_LOW>,
-				     <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-names = "pcie_irq";
 			clocks = <&pciesys CLK_PCIE_P1_MAC_EN>,
 				 <&pciesys CLK_PCIE_P0_AHB_EN>,
 				 <&pciesys CLK_PCIE_P1_AUX_EN>,
@@ -390,21 +395,19 @@
 			power-domains = <&scpsys MT7622_POWER_DOMAIN_HIF0>;
 			bus-range = <0x00 0xff>;
 			ranges = <0x82000000 0 0x20000000 0x20000000 0 0x10000000>;
+			status = "disabled";
 
-			pcie1: pcie@1,0 {
-				device_type = "pci";
+			slot1: pcie@1,0 {
 				reg = <0x0800 0 0 0 0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
 				#interrupt-cells = <1>;
 				ranges;
-				num-lanes = <1>;
 				interrupt-map-mask = <0 0 0 7>;
 				interrupt-map = <0 0 0 1 &pcie_intc1 0>,
 						<0 0 0 2 &pcie_intc1 1>,
 						<0 0 0 3 &pcie_intc1 2>,
 						<0 0 0 4 &pcie_intc1 3>;
-
 				pcie_intc1: interrupt-controller {
 					interrupt-controller;
 					#address-cells = <0>;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
