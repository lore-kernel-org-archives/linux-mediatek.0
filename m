Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E2CC5479D
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8vHiUWoDSzO/kvwU/kQ5GyXJ4YHFhfMCpPp4lOgl4w=; b=Y99jZ1ZKu0QSxFebwyimnGXi9B
	0JrdmujrhasdDyYmlVhXluw4xKvF+7qYXLknQViGvwo0byXSYM0GKbYanDj/qsFLAY+L+1QuR090D
	swQVdlQSwsQfdb3Io5OYlqdXveHusw856smfo+bB9EY9z8w96KXxTVBU57StvnEBpsSj/aIBdd87D
	pk2n5GFgnE+onzGWQTztp3jVwAdpLt4H4YoAaoZm47mFvEcjSJ6RJScuPrV06iyZQznYr6Z65Qcyc
	NaXGsaJJjjyM2SYSIzCqV/Uy7HtoV6761Vpekuo5SkBSXKnGAUHcX7vAhAyvbvWnyAYNrZlYgt4zm
	xkW+sVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWLb-00EIIs-Ut; Thu, 05 Jan 2023 19:56:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDMZb-009d7u-LC; Thu, 05 Jan 2023 09:30:12 +0000
X-UUID: 3865e793ef1b4594b5dc539f20665be0-20230105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=F8vHiUWoDSzO/kvwU/kQ5GyXJ4YHFhfMCpPp4lOgl4w=;
	b=BDVzc8pMwf7F6o4DXGwhz36LmOzQyvwXkj/irh8XYMwxuCEjkTvP0iPZPGwkR1nIWWMr+6N7kv2d+nxFmXTn0b+FTxHJnv6KVEgdLDiq8+WOd9dDB/GiAS7K070E6QJtusn9PJLVL9iJdI5pncwDbzrmDIKxH5FsqJbRNr3jk/k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:3c7c8fcc-3d08-4619-8d1c-b5aba78f1e76,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:543e81c,CLOUDID:1ddfbb53-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 3865e793ef1b4594b5dc539f20665be0-20230105
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 708833077; Thu, 05 Jan 2023 02:29:37 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 5 Jan 2023 17:29:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 5 Jan 2023 17:29:35 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Miles Chen <miles.chen@mediatek.com>, <linux-usb@vger.kernel.org>, Chunfeng
 Yun <chunfeng.yun@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
	Rex-BC Chen <rex-bc.chen@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH 2/3] arm64: dts: mediatek: switch MT8195 boards into different USB configurations
Date: Thu, 5 Jan 2023 17:28:08 +0800
Message-ID: <20230105092809.14214-2-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230105092809.14214-1-macpaul.lin@mediatek.com>
References: <20230105092809.14214-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_013007_980702_3F5C242A 
X-CRM114-Status: GOOD (  12.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This modification includes
  1. Remove common USB configurations in mt8195.dtsi.
  2. Switch include dtsi "mt8195-laptop-usb.dtsi" for LAPTOP devices.
     - mt8195-cherry.dtsi
     - mt8195-evb.dts
  3. Switch include dtsi "mt8195-iot-usb.dtsi" for IOT devices.
     - mt8195-demo.dts

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 97 -------------------
 4 files changed, 3 insertions(+), 100 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 560103e29017..a28da16d1d74 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -5,7 +5,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/spmi/spmi.h>
-#include "mt8195.dtsi"
+#include "mt8195-laptop-usb.dtsi"
 #include "mt6359.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index dec85d254838..07a864cb8b54 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -5,7 +5,7 @@
  */
 /dts-v1/;
 
-#include "mt8195.dtsi"
+#include "mt8195-iot-usb.dtsi"
 #include "mt6359.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
index 690dc7717f2c..c7026c0f2ca9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-evb.dts
@@ -4,7 +4,7 @@
  * Author: Seiya Wang <seiya.wang@mediatek.com>
  */
 /dts-v1/;
-#include "mt8195.dtsi"
+#include "mt8195-laptop-usb.dtsi"
 
 / {
 	model = "MediaTek MT8195 evaluation board";
diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..ac953a6e3ca7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1046,31 +1046,6 @@
 			status = "disabled";
 		};
 
-		xhci0: usb@11200000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x11200000 0 0x1000>,
-			      <0 0x11203e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port0 PHY_TYPE_USB2>,
-			       <&u3port0 PHY_TYPE_USB3>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
-				 <&topckgen CLK_TOP_SSUSB_REF>,
-				 <&apmixedsys CLK_APMIXED_USB1PLL>,
-				 <&clk26m>,
-				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 103>;
-			wakeup-source;
-			status = "disabled";
-		};
-
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8195-mmc",
 				     "mediatek,mt8183-mmc";
@@ -1114,78 +1089,6 @@
 			status = "disabled";
 		};
 
-		xhci1: usb@11290000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x11290000 0 0x1000>,
-			      <0 0x11293e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port1 PHY_TYPE_USB2>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_1P>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI_1P>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
-				 <&topckgen CLK_TOP_SSUSB_P1_REF>,
-				 <&apmixedsys CLK_APMIXED_USB1PLL>,
-				 <&clk26m>,
-				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 104>;
-			wakeup-source;
-			status = "disabled";
-		};
-
-		xhci2: usb@112a0000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x112a0000 0 0x1000>,
-			      <0 0x112a3e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port2 PHY_TYPE_USB2>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_2P>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI_2P>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
-				 <&topckgen CLK_TOP_SSUSB_P2_REF>,
-				 <&clk26m>,
-				 <&clk26m>,
-				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 105>;
-			wakeup-source;
-			status = "disabled";
-		};
-
-		xhci3: usb@112b0000 {
-			compatible = "mediatek,mt8195-xhci",
-				     "mediatek,mtk-xhci";
-			reg = <0 0x112b0000 0 0x1000>,
-			      <0 0x112b3e00 0 0x0100>;
-			reg-names = "mac", "ippc";
-			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
-			phys = <&u2port3 PHY_TYPE_USB2>;
-			assigned-clocks = <&topckgen CLK_TOP_USB_TOP_3P>,
-					  <&topckgen CLK_TOP_SSUSB_XHCI_3P>;
-			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
-						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
-			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
-				 <&topckgen CLK_TOP_SSUSB_P3_REF>,
-				 <&clk26m>,
-				 <&clk26m>,
-				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
-			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck",
-				      "xhci_ck";
-			mediatek,syscon-wakeup = <&pericfg 0x400 106>;
-			wakeup-source;
-			status = "disabled";
-		};
-
 		pcie0: pcie@112f0000 {
 			compatible = "mediatek,mt8195-pcie",
 				     "mediatek,mt8192-pcie";
-- 
2.18.0


