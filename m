Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55241C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:29:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18E5060FEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 21:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18E5060FEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHllkZrEljPIv1z0Ios9Q3L1g4R0sCmdkyBkcuKVvSk=; b=2Outl/Tb7Y4PAZ
	AfNNsVa/eSktue2EYz/R1uInPHon45fZQmtB2bTnux63a+PNgRMZZhFmVv4Qb06m3R9MtOVbLVxcS
	jAy+b0YlrGswNL2sZ4yBj2offF2uPqZMrJ9WjlugMGkgyxbrD1Bwrfq5obJg0glGKjsV8hEDgMWQU
	Rs33zVP5imCr/Att/flK7fFxr3n9fpq4Qn5VD+louGUF+NlXx7MkLSHcWhgvaDv/+fz+WvPGrnPbv
	kGUzCKOtN8Dn49kpm1mmOPcVTiZtfPYeKNMNE/1BwdT0VKVKouKZ+jLM4aHHfwj6+FjKATwQUnKxr
	h4j5lsLh7m78eooyVnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltGcc-0039lC-Rm; Tue, 15 Jun 2021 21:29:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltCvn-001lI9-I0; Tue, 15 Jun 2021 17:32:57 +0000
X-UUID: 965b8b0fa30d49e39602dcc9fcc7c2bc-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vO2oTGAnLTmeDVzliNmXLE/8Xl/V6f9Nkt7GNF1OsDE=; 
 b=V1NF8rEB9l9W0WqCUkSY8wDz6WYp0oj0Dsr1rUvmdGyABE/zv8Si247+NRhZGq6OwrUAjRuvebtQ7QVicTsueEQquVsThCV64UAdc3tP/e3ajQp9OTeuZkfL1uCLgQOpIS8Y9sUfKhpWhO/SaymVn76BHtPNUY7t9S8J7dFqWoM=;
X-UUID: 965b8b0fa30d49e39602dcc9fcc7c2bc-20210615
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1609789179; Tue, 15 Jun 2021 10:32:48 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 10:32:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:32:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 01:32:44 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <seiya.wang@mediatek.com>, <wenst@google.com>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tianping Fang
 <tianping.fang@mediatek.com>
Subject: [PATCH 14/27] arm64: dts: mt8195: add usb support
Date: Wed, 16 Jun 2021 01:32:20 +0800
Message-ID: <20210615173233.26682-14-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20210615173233.26682-1-tinghan.shen@mediatek.com>
References: <20210615173233.26682-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_103255_770106_E2348F80 
X-CRM114-Status: GOOD (  10.37  )
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

From: Tianping Fang <tianping.fang@mediatek.com>

Add usb support for mt8195 SoC.

Signed-off-by: Tianping Fang <tianping.fang@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 110 ++++++++++++++++++++---
 1 file changed, 100 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 1a281551d011..41d9f167701f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -957,6 +957,28 @@
 			status = "disabled";
 		};
 
+		xhci: xhci@11200000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11200000 0 0x1000>,
+			      <0 0x11203e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port0 PHY_TYPE_USB2>,
+			       <&u3port0 PHY_TYPE_USB3>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_SSUSB>,
+				 <&infracfg_ao CLK_INFRA_AO_SSUSB_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+		};
+
 		mmc0: mmc@11230000 {
 			compatible = "mediatek,mt8195-mmc",
 				     "mediatek,mt8192-mmc",
@@ -987,6 +1009,70 @@
 			status = "disabled";
 		};
 
+		xhci1: xhci1@11290000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x11290000 0 0x1000>,
+			      <0 0x11293e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port1 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_1P_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_1P_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_1P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_1P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P1_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+		};
+
+		xhci2: xhci2@112a0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112a0000 0 0x1000>,
+			      <0 0x112a3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port2 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_2P_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_2P_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P2_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+		};
+
+		xhci3: xhci3@112b0000 {
+			compatible = "mediatek,mt8195-xhci",
+				     "mediatek,mtk-xhci";
+			reg = <0 0x112b0000 0 0x1000>,
+			      <0 0x112b3e00 0 0x0100>;
+			reg-names = "mac", "ippc";
+			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
+			phys = <&u2port3 PHY_TYPE_USB2>;
+			assigned-clocks = <&topckgen CLK_TOP_USB_3P_SEL>,
+					  <&topckgen CLK_TOP_SSUSB_XHCI_3P_SEL>;
+			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
+						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
+			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
+				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>,
+				 <&topckgen CLK_TOP_SSUSB_P3_REF>;
+			clock-names = "sys_ck", "xhci_ck", "ref_ck";
+			usb2-lpm-disable;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			status = "disabled";
+		};
+
 		pcie0: pcie@112f0000 {
 			device_type = "pci";
 			compatible = "mediatek,mt8195-pcie";
@@ -1080,7 +1166,7 @@
 
 			u2port2: usb-phy@0 {
 				reg = <0x0 0x700>;
-				clocks = <&clk26m>;
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P2_REF>;
 				clock-names = "ref";
 				#phy-cells = <1>;
 			};
@@ -1095,7 +1181,7 @@
 
 			u2port3: usb-phy@0 {
 				reg = <0x0 0x700>;
-				clocks = <&clk26m>;
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P3_REF>;
 				clock-names = "ref";
 				#phy-cells = <1>;
 			};
@@ -1244,15 +1330,17 @@
 
 			u2port1: usb-phy@0 {
 				reg = <0x0 0x700>;
-				clocks = <&clk26m>;
-				clock-names = "ref";
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P1_REF>,
+					 <&apmixedsys CLK_APMIXED_USB1PLL>;
+				clock-names = "ref", "da_ref";
 				#phy-cells = <1>;
 			};
 
 			u3port1: usb-phy@700 {
 				reg = <0x700 0x700>;
-				clocks = <&clk26m>;
-				clock-names = "ref";
+				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
+					 <&topckgen CLK_TOP_SSUSB_PHY_P1_REF>;
+				clock-names = "ref", "da_ref";
 				#phy-cells = <1>;
 			};
 		};
@@ -1266,15 +1354,17 @@
 
 			u2port0: usb-phy@0 {
 				reg = <0x0 0x700>;
-				clocks = <&clk26m>;
-				clock-names = "ref";
+				clocks = <&topckgen CLK_TOP_SSUSB_PHY_REF>,
+					 <&apmixedsys CLK_APMIXED_USB1PLL>;
+				clock-names = "ref", "da_ref";
 				#phy-cells = <1>;
 			};
 
 			u3port0: usb-phy@700 {
 				reg = <0x700 0x700>;
-				clocks = <&clk26m>;
-				clock-names = "ref";
+				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M>,
+					 <&topckgen CLK_TOP_SSUSB_PHY_REF>;
+				clock-names = "ref", "da_ref";
 				#phy-cells = <1>;
 			};
 		};
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
