Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3566C369BD
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1encuTVAcrrucgWTZkTd+WBasAHgfxaRmuM38brREg=; b=vIG1jWL/gqrLyA
	Y3SXF6/L3yawuG4rrhoqSZ3ePo4zKz5QRv4N4UfLi/8Hp6yxq5KhPcPBFU3MnlGk0eDOsX3xcj9Ac
	yhq9uzmcI8gWyPaiWQm5vot3KMYvZODdZ/sFD4YXqk/ajzGASQM8vsrZAnEHvu5hDTp+khFVP4V0h
	Dbu/hlE/ryOcJjLbsa75Hz2elJjnyyDssYXebh1qreNwe2K+t5D+DQEyvh2F8mDo7EV+nlE1Ro1JU
	/tsGso/JeyaqhZXOx8dI4nR7iqrK2Pe4Pt0pYxzCWbI2ihtAiiZoB2KrfzxUUKLdk+MIJUradu5Os
	3WYbKkAzppnkvnrcp20g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u504v-00000009CGn-2MFq;
	Wed, 16 Apr 2025 10:33:13 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4zTN-0000000936e-0QuQ;
	Wed, 16 Apr 2025 09:54:26 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 29098101211;
	Wed, 16 Apr 2025 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1744797263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/1encuTVAcrrucgWTZkTd+WBasAHgfxaRmuM38brREg=;
	b=oEMXnpNJiECwDtBUataqIbbBkdC8VpsV5TaLlhjUiBR29Zo0llf+CHRkYR+wzsHChOqYJo
	vTOmJZtONjz6HNTxipujEWWorwBISef7Nro01YDdRnFCg5AMPwnjlIfuOiXBhGVWwg5MBQ
	NdadIfHxPL7DO3x5eWPGojcCp8o0Gyk=
Received: from frank-u24.. (fttx-pool-80.245.72.47.bambit.de [80.245.72.47])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 4905D360084;
	Wed, 16 Apr 2025 09:54:22 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 7/8] arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
Date: Wed, 16 Apr 2025 11:53:59 +0200
Message-ID: <20250416095402.90543-8-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416095402.90543-1-linux@fw-web.de>
References: <20250416095402.90543-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ddb25738-050a-4fc7-8795-db407a6b1ea9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_025425_288318_CA5658CF 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

First usb and third pcie controller on mt7988 need a xs-phy to work
properly.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v3:
- drop unneeded properties and compatibles from topmisc
- xsphy unit name not changed because binding requires this name (not only phy)
- also not changed port names to be clear abour which phy is used (mt7988 also have tphy)
- change offset to have clean syscon (without power controller)
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 36 +++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 88b56a24efca..72792f4ccde3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -334,6 +334,8 @@ usb@11190000 {
 				 <&infracfg CLK_INFRA_133M_USB_HCK>,
 				 <&infracfg CLK_INFRA_USB_XHCI>;
 			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
+			phys = <&xphyu2port0 PHY_TYPE_USB2>,
+			       <&xphyu3port0 PHY_TYPE_USB3>;
 			status = "disabled";
 		};
 
@@ -398,6 +400,9 @@ pcie2: pcie@11280000 {
 			pinctrl-0 = <&pcie2_pins>;
 			status = "disabled";
 
+			phys = <&xphyu3port0 PHY_TYPE_PCIE>;
+			phy-names = "pcie-phy";
+
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
@@ -548,6 +553,37 @@ tphyu3port0: usb-phy@11c50700 {
 			};
 		};
 
+
+		topmisc: system-controller@11d10000 {
+			compatible = "mediatek,mt7988-topmisc",
+				     "syscon";
+			reg = <0 0x11d10084 0 0xff80>;
+		};
+
+		xs-phy@11e10000 {
+			compatible = "mediatek,mt7988-xsphy",
+				     "mediatek,xsphy";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			status = "disabled";
+
+			xphyu2port0: usb-phy@11e10000 {
+				reg = <0 0x11e10000 0 0x400>;
+				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+			};
+
+			xphyu3port0: usb-phy@11e13000 {
+				reg = <0 0x11e13400 0 0x500>;
+				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
+				clock-names = "ref";
+				#phy-cells = <1>;
+				mediatek,syscon-type = <&topmisc 0x194 0>;
+			};
+		};
+
 		clock-controller@11f40000 {
 			compatible = "mediatek,mt7988-xfi-pll";
 			reg = <0 0x11f40000 0 0x1000>;
-- 
2.43.0


